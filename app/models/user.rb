# frozen_string_literal: true

##
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :owned_want_lists, class_name: 'WantList', dependent: :destroy
  has_and_belongs_to_many :want_lists, dependent: :destroy
  has_and_belongs_to_many :fedex_accounts, dependent: :destroy

  enum role: %i[user admin warehouse]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(email: data['email'], password: Devise.friendly_token[0, 20])

    user
  end

  def all_want_lists
    WantList.joins('LEFT JOIN "users_want_lists" ON "users_want_lists"."want_list_id" = "want_lists"."id"')
            .where("want_lists.user_id=#{id} OR users_want_lists.user_id=#{id} OR want_list_privacy_id = 1")
            .distinct
  end
end
