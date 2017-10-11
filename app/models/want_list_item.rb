class WantListItem < ApplicationRecord
  validates :ean, presence: true

  belongs_to :want_list

  has_one :user, :through => :want_list

  belongs_to :book, :foreign_key => :ean, :primary_key => :ean
end
