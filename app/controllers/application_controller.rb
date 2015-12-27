class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #before_action :autherticate_user!, except: [:init, :login]

  def authenticate_user!
    if (!session[:user_name])
      redirect_to login_url
    else
      redirect_to login_url
    end
  end

  helper_method :authenticate_user!

  def current_user
    @current_user ||= User.find(session[:user_name]) if session[:user_name]
  end

  helper_method :current_user

  def init
  end

  def login
  end

end
