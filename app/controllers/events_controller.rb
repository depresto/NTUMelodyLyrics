class EventsController < ApplicationController

	def show

    event     = nil
    equipment = nil

    case params[:type]
      when 'room'     
        event   = BorrowRoom
        @result = event.select(:id, :title, :start, :end).where(start: params[:start]..params[:end])
      when 'calendar' 
        event   = Schedule
        @result = event.joins(:schedule_content).select(:id, :title, :start, :end, :content).where(start: params[:start]..params[:end])
      when 'keyboard' then equipment = BorrowKeyboard
      when 'book'     then equipment = BorrowBook
    end

    @result = nil unless event

    render json: @result
  end

  def create

    event     = nil
    equipment = nil

    case params[:type]
      when 'room'     then event = BorrowRoom.new
      when 'calendar' then event = Schedule.new
      when 'keyboard' then equipment = BorrowKeyboard.new
      when 'book'     then equipment = BorrowBook.new
    end

    if event

      e_start  = params[:startdate] +'T'+ params[:starttime]+':00'
      e_end    = params[:enddate]   +'T'+ params[:endtime]  +':00'

      case params[:type]
      when 'room'     then event.title = session[:user_name] 
      when 'calendar' then event.title = params[:title]      
      end

      @title      = event.title
      event.start = e_start
      event.end   = e_end

      @status = event.save! ? "saved!" : "not saved"

      if params[:type] == 'calendar' #Save event content if in calendar page
        schedule              = ScheduleContent.new
        schedule.schedule_id  = event.id
        schedule.content      = params[:content]
        @content = params[:content].html_safe
        schedule.save!
      end
    end

    respond_to :js
  end

  def destroy 

    case params[:type]
      when 'room'
        event = BorrowRoom.exists?(id: params[:id], title: session[:user_name])
        # Destroy borrow event if user match the event
        @success = BorrowRoom.destroy(params[:id]) ? true : false if event 
      when 'calendar'
        # Destory Events if user is admin
        if session[:isadmin]
          @success = Schedule.destroy(params[:id]) ? true : false
        else
          @success = false
        end
      when 'keyboard'
      when 'book'
    end
  end
end