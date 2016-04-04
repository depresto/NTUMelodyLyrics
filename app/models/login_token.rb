class LoginToken < ActiveRecord::Base
	belongs_to :user
	validates :s_id, presence: true
	before_save :generate_token

	def generate_token
		self.token = SecureRandom.urlsafe_base64
	end

	def self.authenticate_token(token)
		username = select(:s_id).where(token: token).order(id: :desc).limit(1)
		user = User.where(s_id: username).select(:s_id, :name, :password_hash, :password_salt, :isadmin).limit(1).first
		
		return if user.blank?

		user
	end
end
