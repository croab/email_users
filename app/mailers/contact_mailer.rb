class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def submission(message, to_email)
    @message = message
    @to_email = to_email
    mail(to: @to_email, subject: 'New contact page submission')
  end
end
