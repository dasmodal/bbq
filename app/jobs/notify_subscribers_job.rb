class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(model)
    event = model.event
    model_type = model.class.name.downcase
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [model.user&.email]).uniq

    all_emails.each do |mail|
      EventMailer.send(model_type, model, mail).deliver_now
    end
  end
end
