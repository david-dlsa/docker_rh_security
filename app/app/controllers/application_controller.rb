class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticate_adm?
  def authenticate_user!
    redirect_to '/users/sign_in' unless current_user
  end

  def authenticate_adm?
    return true if current_user && current_user.admin
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def send_error_info
    erro_info = params.merge(client_ip: request.remote_ip,
                             at: DateTime.now)

    ErrorInfoMailer.with(error_info: erro_info).catch_error.deliver_now!

    redirect_to root_path
  end
end
