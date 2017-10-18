require 'test_helper'

class AdminTest < ActiveSupport::TestCase

	def setup
		@admin = Admin.new(name: "Example Admin", email: "Admin@example.com")
	end

	test "should be valid" do
		assert @admin.valid?
	end

	test "name should be present" do
		@admin.name = "     "
		assert_not @admin.valid?
	end

	test "email should be present" do
		@admin.email = "     "
		assert_not @admin.valid?
	end

	test "name should not be too long" do
		@admin.name = "a" * 51
		assert_not @admin.valid?
	end

	test "email should not be too long" do
		@admin.email = "a" * 244 + "@example.com"
		assert_not @admin.valid?
	end

	test "email validation should accept valid addresses" do
		valid_addresses = %w[admin@example.com Admin@foo.COM A_US-ER@foo.bar.org
	                 	first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@admin.email = valid_address
			assert @admin.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "email addresses should be unique" do
		duplicate_admin = @admin.dup
		duplicate_admin.email = @admin.email.upcase
		@admin.save
		assert_not duplicate_admin.valid?
	end
end
