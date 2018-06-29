# frozen_string_literal: true

##
class Source < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  belongs_to :source_type
  has_many :accounts
end
