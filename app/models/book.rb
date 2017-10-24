class Book < ApplicationRecord
  validates :ean, :isbn, uniqueness: true
  validates :ean, :isbn, presence: true

  has_one :amazon_datum, :dependent => :destroy
  has_one :guide_datum, :dependent => :destroy
  has_one :indaba_datum, :dependent => :destroy
  has_many :indaba_instances, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :fbaz_data, :dependent => :destroy

  has_many :want_list_items, :foreign_key => :ean, :primary_key => :ean
end
