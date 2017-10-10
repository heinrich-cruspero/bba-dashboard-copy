class WantListItem < ApplicationRecord
  belongs_to :want_list
  has_one :user, :through => :want_list
end
