class AdminController < ApplicationController
	before_filter :is_admin?, :only => :addproperty

  def user
    @user = User.all
  end

  def adduser
  end

  def property
  end

  def addproperty
  	logger.debug params[:picture]
    uploaded_io = params[:picture]

  	respond_to do |format|
      format.js 
    end
  end
  
end
