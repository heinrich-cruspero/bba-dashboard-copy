# frozen_string_literal: true

##
class IndabaInstance < ApplicationRecord
  has_many :indaba_insatnce_data
  has_many :indaba_orders
end
