class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.subscription.subject
  #
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event
    @greeting = "Hi"

    mail to: event.user.email,subject: "Новая подписка на #{event.title}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.comment.subject
  #
  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: "Новый комментарий @ #{@event.title}"
  end

  def photo(photo, email)
    @event = photo.event
    @user = photo.user
    @photo = photo.photo.variant(resize_to_fit: [500, 500])

    mail to: email, subject: "Новая фотография @ #{@event.title}"
  end
end
