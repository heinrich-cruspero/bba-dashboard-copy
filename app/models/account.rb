# frozen_string_literal: true

##
class Account < ApplicationRecord
  validates :name, :source, :account_number,
            :address_ln1, :city, :state, :zip, presence: true
  validates :name, uniqueness: { scope: :source }

  belongs_to :source
  has_one :source_type, through: :source
end
