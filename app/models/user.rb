class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :reservations

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    unless user
      user = User.create(email: data['email'],
                         provider: access_token.provider,
                         uid: access_token.uid,
                         token: access_token.credentials.token,
                         refresh_token: access_token.credentials.refresh_token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end
end
