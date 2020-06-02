# frozen_string_literal: true

##
class Book < ApplicationRecord
  validates :ean, :isbn, uniqueness: true
  validates :ean, :isbn, presence: true

  has_one :amazon_datum, dependent: :destroy
  has_one :guide_datum, dependent: :destroy
  has_one :indaba_datum, dependent: :destroy
  has_many :indaba_instance_data, dependent: :destroy
  has_many :indaba_orders, dependent: :destroy

  has_many :want_list_items, foreign_key: :ean, primary_key: :ean

  def self.create_from_data_wh_result(result)
    Book.create(ean: result[0]['ean'], isbn: result[0]['isbn'],
                author: result[0]['author'], title: result[0]['title'],
                publisher:  result[0]['publisher'], edition: result[0]['edition'],
                publication_date: result[0]['publication_date'])
  end
end
