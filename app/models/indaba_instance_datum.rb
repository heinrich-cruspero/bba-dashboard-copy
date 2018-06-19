# frozen_string_literal: true

##
class IndabaInstanceDatum < ApplicationRecord
  belongs_to :indaba_instance
  belongs_to :book
end
