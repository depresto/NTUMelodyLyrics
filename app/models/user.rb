class User < ActiveRecord::Base
	attr_accessor :password
	alias_attribute :username, :s_id
	# 關聯式資料
	has_many :login_tokens, dependent: :destroy
	# 學號與姓名不可為空
	validates :s_id, uniqueness: true, presence: true
	validates :password, presence: true
	before_save :encrypt_password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(username="", password="", rememberred)
		
		return if ( username.blank? || password.blank? )

		result = where(s_id: username).select(:s_id, :name, :password_hash, :password_salt, :isadmin).limit(1).as_json
		
		return if result.blank?

		user = result[0]
		login_hash = BCrypt::Engine.hash_secret(password, user['password_salt'])
		if user['password_hash'] == login_hash
			if rememberred
				where(s_id: username).first.update_column(:rememberred, Rails.configuration.x.sql_true)

				token = LoginToken.new
				token.s_id = username

				user['login_token'] = token.token if token.save
			end
			user
		else
			nil
		end
	end
end
