class Book < ApplicationRecord
  has_one :amazon_datum, :dependent => :destroy
  has_one :guide_datum, :dependent => :destroy
  has_one :indaba_datum, :dependent => :destroy
end
