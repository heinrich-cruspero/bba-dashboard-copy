# frozen_string_literal: true

##
class GenerateReturnsJob < ActiveJob::Base
  queue_as :default

  def perform
    require 'savon'

    rental_return = RentalReturn.first
    fedex_account = rental_return.fedex_account

    client = Savon.client(wsdl: Rails.root + 'app/jobs/OpenshipService_v17.wsdl',
                          env_namespace: 'SOAP-ENV',
                          namespace_identifier: :ns1,
                          convert_request_keys_to: :none,
                          endpoint: Rails.env.production? ? 'https://ws.fedex.com:443/web-services/openship' : 'https://wsbeta.fedex.com:443/web-services/openship')

    message =
      {
        WebAuthenticationDetail:
              {
                UserCredential:
                      {
                        Key: fedex_account.key.to_s,
                        Password: fedex_account.password.to_s
                      }
              },
        ClientDetail:
              {
                AccountNumber: fedex_account.account_number.to_s,
                MeterNumber: fedex_account.meter_number.to_s
              },
        TransactionDetail:
              {
                CustomerTransactionId: rental_return.id.to_s
              },
        Version:
              {
                ServiceId: 'ship',
                Major: '17',
                Intermediate: '0',
                Minor: '0'
              },
        Actions: 'TRANSFER',
        RequestedShipment:
              {
                ShipTimestamp: Time.now.to_datetime,
                DropoffType: 'REGULAR_PICKUP',
                ServiceType: 'FEDEX_2_DAY',
                PackagingType: 'YOUR_PACKAGING',
                Shipper:
                      {
                        Contact:
                              {
                                PersonName: rental_return.name.to_s,
                                PhoneNumber: rental_return.phone_number.to_s
                              },
                        Address:
                              {
                                StreetLines: rental_return.street.to_s,
                                City: rental_return.city.to_s,
                                StateOrProvinceCode: rental_return.state.to_s,
                                PostalCode: rental_return.zip_code.to_s,
                                CountryCode: 'US',
                                Residential: 'true'
                              }
                      },
                Recipient:
                      {
                        Contact:
                              {
                                PersonName: fedex_account.name.to_s,
                                CompanyName: fedex_account.company_name.to_s,
                                PhoneNumber: fedex_account.phone_number.to_s
                              },
                        Address:
                              {
                                StreetLines: fedex_account.street.to_s,
                                City: fedex_account.city.to_s,
                                StateOrProvinceCode: fedex_account.state.to_s,
                                PostalCode: fedex_account.zip_code.to_s,
                                CountryCode: 'US',
                                Residential: 'false'
                              }
                      },
                ShippingChargesPayment:
                      {
                        PaymentType: 'SENDER',
                        Payor:
                              {
                                ResponsibleParty:
                                      {
                                        AccountNumber: fedex_account.account_number.to_s,
                                        Address:
                                              {
                                                CountryCode: 'US'
                                              }
                                      }
                              }
                      },
                SpecialServicesRequested:
                      {
                        SpecialServiceTypes: %w[RETURN_SHIPMENT PENDING_SHIPMENT],
                        ReturnShipmentDetail:
                              {
                                ReturnType: 'PENDING',
                                ReturnEMailDetail:
                                      {
                                        MerchantPhoneNumber: fedex_account.phone_number.to_s,
                                        AllowedSpecialServices: 'SATURDAY_DELIVERY'
                                      }
                              },
                        PendingShipmentDetail:
                              {
                                Type: 'EMAIL',
                                ExpirationDate: (Time.now + 30.days).to_date,
                                EmailLabelDetail:
                                      {
                                        Recipients:
                                              {
                                                EmailAddress: 'recipeint@company.com',
                                                Role: 'SHIPMENT_COMPLETOR'
                                              }
                                      }
                              }
                      },
                LabelSpecification:
                      {
                        LabelFormatType: 'COMMON2D',
                        ImageType: 'PDF'
                      },
                "PackageCount": '1',
                "RequestedPackageLineItems":
                      {
                        "SequenceNumber": '1',
                        "InsuredValue":
                              {
                                "Currency": 'USD',
                                "Amount": '80'
                              },
                        "Weight":
                              {
                                "Units": 'LB',
                                "Value": '1'
                              },
                        "ItemDescription": 'Description'
                      }
              }
      }

    response = client.call(:create_pending_shipment, message: message)

    rental_return.update(response: response.body)
  end
end
