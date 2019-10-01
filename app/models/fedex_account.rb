# frozen_string_literal: true

##
class FedexAccount < ApplicationRecord
  validates :key, :password, :account_number, :meter_number, :name, :company_name, :phone_number, :street, :city, :state, :zip_code, presence: true

  has_many :rental_returns, dependent: :destroy
end
