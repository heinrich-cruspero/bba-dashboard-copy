# frozen_string_literal: true

##
class FedexAccount < ApplicationRecord
  has_many :rental_returns
end
