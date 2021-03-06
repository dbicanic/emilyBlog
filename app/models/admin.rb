class Admin < ApplicationRecord
	attr_accessor :remember_token
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 30 }
	VaildEmailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 250 }, 
		format: { with: VaildEmailRegex }, 
		uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	def Admin.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end

	# Returns a random token.
	def Admin.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
	    self.remember_token = Admin.new_token
	    update_attribute(:remember_digest, Admin.digest(remember_token))
  	end

  	def authenticated?(remember_token)
  		return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end

  	def forget
    	update_attribute(:remember_digest, nil)
  	end
end
