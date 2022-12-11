class RentalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rental_mailer.confirmation.subject
  #
  def confirmation
    @rental = params[:rental]
    mail to: @rental.user.email, subject: "Rental Confirmation of #{@rental.car.name}"
  end
end
