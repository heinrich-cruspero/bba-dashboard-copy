class WantListItem < ApplicationRecord
  validates :ean, presence: true

  belongs_to :want_list

  has_one :user, :through => :want_list, :source => 'owner'

  belongs_to :book, :foreign_key => :ean, :primary_key => :ean, optional: true

  def self.to_csv
    attributes = %w{ean quantity quantity_purchased max_price book.author book.title}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |want_list_item|
        csv << attributes.map do |attr|
          if attr.split('.').count > 1
            if want_list_item.send(attr.split('.')[0]).nil?
              ''
            else
              want_list_item.send(attr.split('.')[0]).send(attr.split('.')[1])
            end
          else
            want_list_item.send(attr)
          end
        end
      end
    end
  end
end
