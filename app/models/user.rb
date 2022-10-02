require 'open-uri'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[vkontakte facebook google_oauth2]

  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos
  has_one_attached :avatar

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  def self.find_for_vkontakte_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first
    image = URI.parse(access_token.info.image).open

    return user if user.present?

    provider = access_token.provider
    uid = access_token.uid

    where(uid: uid, provider: provider).first_or_create! do |user|
      user.email = email
      user.password = Devise.friendly_token.first(16)
      user.avatar.attach(io: image, filename: 'avatar.jpg')
    end
  end

  def self.find_for_facebook_oauth(access_token)
    binding.pry
  end

  def self.find_for_google_oauth2(access_token)
    email = access_token.info.email
    user = where(email: email).first
    image = URI.parse(access_token.info.image).open

    return user if user.present?

    provider = access_token.provider
    uid = access_token.uid

    where(uid: uid, provider: provider).first_or_create! do |user|
      user.email = email
      user.password = Devise.friendly_token.first(16)
      user.avatar.attach(io: image, filename: 'avatar.jpg')
    end
  end

  private

  def set_name
    self.name = "Товарищ#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
