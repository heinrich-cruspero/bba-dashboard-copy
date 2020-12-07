# frozen_string_literal: true

class EasyPostAccount < ApplicationRecord
  validates :key,
            :account_number,
            :name,
            :company_name,
            :phone_number,
            :street,
            :city,
            :state,
            :zip_code,
            :country, presence: true

  has_many :rental_returns, as: :accountable, dependent: :destroy
  has_and_belongs_to_many :users
end
