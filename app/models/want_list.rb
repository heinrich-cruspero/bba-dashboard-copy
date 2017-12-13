class WantList < ApplicationRecord
  validates :name, presence: true

  belongs_to :want_list_privacy
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :want_list_items, :dependent => :destroy

end
