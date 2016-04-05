class SessionsController < ApplicationController

  def index

    if @user
      redirect_to main_path 
    else 
      redirect_to login_path 
    end
  end

  def create
  	@user = User.authenticate(params[:username], params[:password], params[:remember])
    if @user 
      session[:user_name] = @user['name']
      session[:isadmin] = @user['isadmin']
      @message = "登入成功"

      if @user['login_token']
        cookies.permanent.signed[:user_id] = @user['s_id']
        cookies.permanent[:remember_token] = @user['login_token']
      end
      #logger.debug @message 
    else
      @message = "登入失敗"
      #logger.debug @message 
    end

  	respond_to do |format|
      format.js {
        flash[:notice] = @message
        render :template => 'create.js.erb'
      }
  	end
  end

  def destroy
    cookies.delete :user_id if cookies[:user_id]
    
    if cookies[:remember_token]
      LoginToken.find_by_token(cookies[:remember_token]).update(:token => nil)
      cookies.delete :remember_token
    end

    reset_session
    @message = '您已經登出！'
    flash[:notice] = @message
    
    redirect_to login_path
  end

  def borrow

    case params[:type]
      when 'room'     then event = BorrowRoom.new
      when 'book'     then event = BorrowBook.new
      when 'keyboard' then event = BorrowKeyboard.new
      when 'calendar' then event = Schedule.new
      else                 event = nil
    end

    if event
      e_start  = params[:startdate] +'T'+ params[:starttime]+':00'
      e_end    = params[:enddate]   +'T'+ params[:endtime]  +':00'

      event.title = session[:user_name] if params[:type] == 'room'
      event.title = params[:title]      if params[:type] == 'calendar'
      @title = event.title
      event.start = e_start
      event.end = e_end

      @status = event.save! ? "saved!" : "not saved"

      ScheduleContent.new(:calendar_id => event.id, :content => params[:content]).save! if params[:type] == 'calendar'
    end

    respond_to :js
  end

  def getevent

    case params[:type]
      when 'room'     then event = BorrowRoom
      when 'book'     then event = BorrowBook
      when 'keyboard' then event = BorrowKeyboard
      when 'calendar' then event = Schedule
      else                 event = nil
    end

    @result = event ? 
      event.select(:id, :title, :start, :end).where(start: params[:start]..params[:end]) :
      nil

    respond_to do |format|
      format.html {render template: "sessions/getevent.json.jbuilder"}
    end
    
  end
end
