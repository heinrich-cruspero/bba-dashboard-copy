# frozen_string_literal: true

##
class WantList < ApplicationRecord
  validates :name, :want_list_privacy_id, presence: true
  validates :valore_account_id, :abe_account_id, uniqueness: true, allow_nil: true

  belongs_to :want_list_privacy
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :users, after_add: :sharing_email, dependent: :destroy
  has_many :want_list_items, dependent: :delete_all

  belongs_to :valore_account, optional: true
  belongs_to :abe_account, optional: true
  belongs_to :thrift_account, optional: true

  before_save do
    self.last_submitted_at = nil
  end

  private

  def sharing_email(user)
    WantListMailer.shared_want_list(user, self).deliver_now unless owner.nil?
  end
end
