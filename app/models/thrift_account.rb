# frozen_string_literal: true

##
class ThriftAccount < ApplicationRecord
  has_many :want_lists
end
