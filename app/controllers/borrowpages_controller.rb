class BorrowpagesController < ApplicationController
	before_filter :authenticate_user

	def room
	end

	def book
		@property = BorrowBook.all
	end

	def keyboard
		@property = BorrowKeyboard.all
	end

	def calendar
	end
end
