class WantList < ApplicationRecord
  belongs_to :user
  belongs_to :want_list_privacy
end
