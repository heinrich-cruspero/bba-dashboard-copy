class WantList < ApplicationRecord
  belongs_to :want_list_privacy
  belongs_to :user
  has_many :want_list_items, :dependent => :destroy
end
