class PagesController < ApplicationController
	before_filter :authenticate_user, :only => :main

	def init
		@cookies = cookies.signed[:user_id]
	    @token = cookies[:remember_token]
	    if @token
	    	@user = LoginToken.authenticate_token(@token)
	    end
	    if @user
	      session[:user_name] = @user['name']
	      @url = main_url
	    elsif session[:user_name]
	      @url = main_url
	    else
	      logger.debug "Login error"
	      @url = login_url
	    end
	end

	def login
		if (session[:user_name])
			redirect_to main_url
		end
	end

	def main
	end

	def letsencrypt
	    # use your code here
	    render text: ENV["LETSENCRYPT"]
	  end
end
