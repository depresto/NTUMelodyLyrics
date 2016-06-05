class BorrowList < ActiveRecord::Base
	validates_presence_of :deadline
	
	belongs_to :club_property
	belongs_to :user
end
