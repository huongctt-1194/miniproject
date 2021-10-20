class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      if params[:session][:remember_me]
        remember user
      else
        forget user
      end
      redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end
end
