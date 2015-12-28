class User < ActiveRecord::Base
	attr_accessor :password
	alias_attribute :username, :s_id
	logger.debug(:s_id)
	# 學號與姓名不可為空
	validates :s_id, :name, :password, presence: true
	before_save :encrypt_password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(username, password, rememberred)
		sql = "SELECT s_id, name, password_hash, password_salt, rememberred FROM users WHERE s_id = '#{username}';"
		#sql = "SELECT * FROM users"
		user = ActiveRecord::Base.connection.execute(sql)[0]
		#logger.debug user
		if !user
			nil
		else
			login_hash = BCrypt::Engine.hash_secret(password, user['password_salt'])
			if user['password_hash'] == login_hash
				login_token = nil
				if rememberred
					sql = "UPDATE users SET rememberred = #{Rails.configuration.x.sql_true} WHERE s_id = '#{username}';"
					ActiveRecord::Base.connection.execute(sql)
					login_token = SecureRandom.base64
					sql = "INSERT INTO login_token (s_id, token) VALUES ('#{username}','#{login_token}');"
					ActiveRecord::Base.connection.execute(sql)
					user['login_token'] = login_token
				end
				user
			else
				nil
			end
		end
	end

	def self.authenticate_token(token)
		sql = "SELECT s_id FROM login_token WHERE token = '#{token}';"
		result = ActiveRecord::Base.connection.execute(sql)[0]
		logger.debug result
		sql = "SELECT s_id, name FROM users WHERE s_id = '#{result['s_id']}';"
		user = ActiveRecord::Base.connection.execute(sql)[0]
		user
	end
end
