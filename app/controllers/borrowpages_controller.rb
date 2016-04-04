class BorrowpagesController < ApplicationController
	before_filter :authenticate_user!

	def room
		@view = 'agendaWeek'
		@send_url = ''
	end

	def book
		@view = 'agendaWeek'

	end

	def keyboard
		@view = 'agendaWeek'
	end

	def calendar
		@view = 'month'
	end
end
