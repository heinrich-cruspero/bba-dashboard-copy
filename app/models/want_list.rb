class WantList < ApplicationRecord
  validates :name, presence: true

  belongs_to :want_list_privacy
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :users, after_add: :sharing_email, :dependent => :destroy
  has_many :want_list_items, :dependent => :destroy

  belongs_to :valore_account, optional: true

  private

  def sharing_email(user)
    WantListMailer.shared_want_list(user, self).deliver_now unless self.owner.nil?
  end
end
