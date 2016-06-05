class BorrowpagesController < ApplicationController
	before_filter :authenticate_user

	def room
	end

	def book
		@property = BorrowBook.includes(:borrow_list).all
	end

	def keyboard
		@property = BorrowKeyboard.includes(:borrow_list).all
		logger.debug @property.to_json
	end

	def calendar
	end
end
