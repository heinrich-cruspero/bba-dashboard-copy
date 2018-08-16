# frozen_string_literal: true

##
class AbeAccount < ApplicationRecord
  has_many :want_lists
end
