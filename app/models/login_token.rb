class LoginToken < ActiveRecord::Base
	validates :s_id, presence: true
	before_save :generate_token

	def generate_token
		self.token = SecureRandom.urlsafe_base64
	end

	def self.authenticate_token(token)
		#sql = "SELECT s_id FROM login_tokens WHERE token = '#{token}';"
		#result = ActiveRecord::Base.connection.execute(sql)[0]
		result = select(:s_id).where(token: token).limit(1)[0]
		#logger.debug result
		#sql = "SELECT s_id, name FROM users WHERE s_id = '#{result['s_id']}';"
		#user = ActiveRecord::Base.connection.execute(sql)[0]
		user = User.select(:s_id, :name).where(s_id: result['s_id']).limit(1)
		if user.blank?
			nil
		else
			user[0]
		end
	end
end
