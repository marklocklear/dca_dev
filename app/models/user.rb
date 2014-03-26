class User < ActiveRecord::Base
	before_create :generate_api_key

	has_secure_password
  attr_accessible :email, :password, :password_confirmation

	private

	def generate_api_key
		begin
			self.api_key = SecureRandom.hex
		end while self.class.exists?(api_key: api_key)
	end
end
