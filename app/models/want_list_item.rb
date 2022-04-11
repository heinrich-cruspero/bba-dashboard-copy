# frozen_string_literal: true

##
class WantListItem < ApplicationRecord
  validates :ean, :quantity, :quantity_purchased, :max_price, presence: true
  validates :ean, length: { is: 13 }
  validates_uniqueness_of :ean, scope: %i[want_list_id ean]

  belongs_to :want_list

  has_one :user, through: :want_list, source: 'owner'

  belongs_to :book, foreign_key: :ean, primary_key: :ean, optional: true

  before_save do
    self.submitted = false
  end

  def self.to_csv
    attributes = %w[EAN ISBN Quantity QuantityPurchased MaxPrice Author Title Publisher Edition ListPrice PercentOfList]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |want_list_item|
        csv << [want_list_item.ean,
                want_list_item.book.nil? ? '' : want_list_item.book.isbn,
                want_list_item.quantity,
                want_list_item.quantity_purchased,
                want_list_item.max_price,
                want_list_item.book.nil? ? '' : want_list_item.book.author,
                want_list_item.book.nil? ? '' : want_list_item.book.title,
                want_list_item.book.nil? ? '' : want_list_item.book.publisher,
                want_list_item.book.nil? ? '' : want_list_item.book.edition,
                want_list_item.book.nil? || want_list_item.book.guide_datum.nil? ? '' : want_list_item.book.guide_datum.list_price,
                want_list_item.book.nil? || want_list_item.book.guide_datum.nil? ? '' : want_list_item.book.guide_datum.list_price * 0.50]
      end
    end
  end
end
