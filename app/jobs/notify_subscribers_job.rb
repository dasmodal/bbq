class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(model)
    event = model.event
    model_type = model.class.name.downcase
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [model.user&.email]).uniq

    EventMailer.send(model_type, model, all_emails).deliver_now
  end
end
