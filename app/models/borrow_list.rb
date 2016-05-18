class BorrowList < ActiveRecord::Base
	validates_presence_of :club_property_id, :user_id, :deadline
end
