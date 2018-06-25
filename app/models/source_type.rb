# frozen_string_literal: true

##
class SourceType < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
