class Schedule < Calendar
	has_one :schedule_content, :dependent => :destroy
end