# frozen_string_literal: true

##
class RentalReturn < ApplicationRecord
  belongs_to :accountable, polymorphic: true

  validates :accountable_id, :email, :name, :phone_number, :street, :city, :state, :zip_code, presence: true

  require 'csv'

  def return_label_message
    {
      WebAuthenticationDetail:
          {
            UserCredential:
                  {
                    Key: accountable.key.to_s,
                    Password: accountable.password.to_s
                  }
          },
      ClientDetail:
            {
              AccountNumber: accountable.account_number.to_s,
              MeterNumber: accountable.meter_number.to_s
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
              ServiceType: accountable.service_type.to_s,
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
                            PersonName: accountable.name.to_s,
                            CompanyName: accountable.company_name.to_s,
                            PhoneNumber: accountable.phone_number.to_s
                          },
                      Address:
                            {
                              StreetLines: accountable.street.to_s,
                              City: accountable.city.to_s,
                              StateOrProvinceCode: accountable.state.to_s,
                              PostalCode: accountable.zip_code.to_s,
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
                                    AccountNumber: accountable.account_number.to_s,
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
                                      MerchantPhoneNumber: accountable.phone_number.to_s,
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

  def self.import(file, accountable_id, accountable_type)
    CSV.foreach(file.path, headers: true) do |row|
      RentalReturn.create! row.to_hash.merge('accountable_id' => accountable_id, 'accountable_type' =>  accountable_type)
    end
  end
end
