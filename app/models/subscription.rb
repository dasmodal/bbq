class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
    unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :user_is_not_event_author, :user_email_already_exists, unless: -> { user.present? }

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end

  def user_is_not_event_author
    if user == event.user
      errors.add(:user, I18n.t('controllers.subscription.user_cant_subscribe_to_self_event'))
    end
  end

  def user_email_already_exists
    if User.find_by(email: user_email).present?
      errors.add(:user_email, I18n.t('controllers.subscription.user_email_already_exists'))
    end
  end
end
