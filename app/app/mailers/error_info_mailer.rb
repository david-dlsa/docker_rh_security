class ErrorInfoMailer < ApplicationMailer
  before_action :load_error

  def catch_error
    mail to: ENV['EMAIL_FROM'],
         subject: "Error was catched"
  end

  private

  def load_error
    @error_info = params[:error_info]
  end
end