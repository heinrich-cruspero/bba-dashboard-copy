# frozen_string_literal: true

##
class IndabaOrder < ApplicationRecord
  belongs_to :book
  belongs_to :indaba_instance
end
