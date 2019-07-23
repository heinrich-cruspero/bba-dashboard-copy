# frozen_string_literal: true

##
class ThriftOrder < ApplicationRecord
  belongs_to :want_list
end
