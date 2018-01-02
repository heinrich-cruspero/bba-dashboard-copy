class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :owned_want_lists, class_name: 'WantList', :dependent => :destroy
  has_and_belongs_to_many :want_lists, :dependent => :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(email: data['email'], password: Devise.friendly_token[0,20] )
    end

    user
  end
end
