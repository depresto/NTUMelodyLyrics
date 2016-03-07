class PagesController < ApplicationController

	def init
		@cookies = cookies.signed[:user_id]
	    @token = cookies[:remember_token]
	    if @token
	    	@user = LoginToken.authenticate_token(@token)
	    end
	    if @user
	      session[:user_name] = @user['name']
	      @url = main_url
	    else
	      logger.debug "Login error"
	      @url = login_url
	    end
	end

	def login
	end

	def main
	end
end
