class WantList < ApplicationRecord
  belongs_to :user
  belongs_to :want_list_privacy
  has_many :want_list_items, :dependent => :destroy
end
