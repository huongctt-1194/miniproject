class ApplicationController < ActionController::Base
  helper_method :log_in

  def log_in (user)
    session[:user_id] = user.id
  end
end
