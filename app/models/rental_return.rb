# frozen_string_literal: true

##
class RentalReturn < ApplicationRecord
  belongs_to :fedex_account

  validates :fedex_account_id, :email, :name, :phone_number, :street, :city, :state, :zip_code, presence: true

  require 'csv'

  def return_label_message
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
              CustomerTransactionId: id.to_s
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
              ServiceType: fedex_account.service_type.to_s,
              PackagingType: 'YOUR_PACKAGING',
              Shipper:
                    {
                      Contact:
                          {
                            PersonName: name.to_s,
                            PhoneNumber: phone_number.to_s
                          },
                      Address:
                            {
                              StreetLines: street.to_s,
                              City: city.to_s,
                              StateOrProvinceCode: state.to_s,
                              PostalCode: zip_code.to_s,
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
                                            EmailAddress: email,
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
                      "ItemDescription": 'Textbooks for ItemDescription'
                    }
            }
    }
  end

  def self.import(file, fedex_account_id)
    CSV.foreach(file.path, headers: true) do |row|
      RentalReturn.create! row.to_hash.merge('fedex_account_id' => fedex_account_id)
    end
  end
end
