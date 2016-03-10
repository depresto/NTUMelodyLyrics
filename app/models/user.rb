class User < ActiveRecord::Base
	attr_accessor :password
	alias_attribute :username, :s_id
	# 學號與姓名不可為空
	validates :s_id, uniqueness: true, presence: true
	validates :password, presence: true
	before_save :encrypt_password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(username="", password="", rememberred)
		
		if ( username.blank? || password.blank? )
			return nil
		end

		#sql = "SELECT s_id, name, password_hash, password_salt, rememberred FROM users WHERE s_id = '#{username}';"
		#sql = "SELECT * FROM users"
		#result = ActiveRecord::Base.connection.execute(sql)
		result = where(s_id: username).select(:s_id, :name, :password_hash, :password_salt, :isadmin).limit(1).as_json
		if result.blank?
			return nil
		end

		user = result[0]
		login_hash = BCrypt::Engine.hash_secret(password, user['password_salt'])
		if user['password_hash'] == login_hash
			login_token = nil
			if rememberred
				#sql = "UPDATE users SET rememberred = #{Rails.configuration.x.sql_true} WHERE s_id = '#{username}';"
				#ActiveRecord::Base.connection.execute(sql)
				where(s_id: username).first.update_column(:rememberred, Rails.configuration.x.sql_true)

				#sql = "INSERT INTO login_token (s_id, token) VALUES ('#{username}','#{login_token}');"
				#ActiveRecord::Base.connection.execute(sql)
				token = LoginToken.new
				token.s_id = username
				#logger.debug user.to_s
				if token.save
					user['login_token'] = token.token
				else
					nil
				end
			end
			user
		else
			nil
		end
	end
end
