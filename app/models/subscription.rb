class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do |user|
    user.validates :user, uniqueness: { scope: :event_id }
  end

  with_options unless: -> { user.present? } do |user|
    user.validates :user_name, presence: true
    user.validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    user.validates :user_email, uniqueness: { scope: :event_id }
    user.validate :user_email_already_exists
  end

  validate :user_is_event_author

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def user_is_event_author
    if user == event.user
      errors.add(:user, :self_event)
    end
  end

  def user_email_already_exists
    if User.find_by(email: user_email).present?
      errors.add(:user_email, :email_exists)
    end
  end
end
