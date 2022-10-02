class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[vkontakte facebook]

  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos
  has_one_attached :avatar

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  def self.find_for_vkontakte_oauth
    binding.pry
  end

  def self.find_for_facebook_oauth(access_token)
    binding.pry
  end

  private

  def set_name
    self.name = "Товарищ#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
