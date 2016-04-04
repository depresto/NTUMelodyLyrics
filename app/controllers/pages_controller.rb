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
	    elsif session[:user_name]
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

	def letsencrypt
	    # use your code here, not mine
	    render text: "5m5pBJyy-AeiPGDX0B4jrQoOkhLSyxXbMIeO2CiQBJ0.p57ZLZ406Ggm-wkRG9LthZMsJF5J0g_x-c_o6l0U2nw"
	  end
end
