class ContactJob < ApplicationJob
  queue_as :default

  def perform(message, to_email)
    ContactMailer.submission(message, to_email).deliver_now!
  end
end
