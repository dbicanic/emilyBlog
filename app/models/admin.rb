class Admin < ApplicationRecord
	validates :name, presence: true, length: { maximum: 30 }
	VaildEmailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 250 }, 
		format: { with: VaildEmailRegex }, 
		uniqueness: { case_sensitive: false }
end
