class ContactController < ApplicationController
  def create
    ContactJob.perform_now(contact_params[:message], contact_params[:to_email])
  end

  private

  def contact_params
    params.permit(:message, :to_email)
  end
end
