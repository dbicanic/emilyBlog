require 'test_helper'

class AdminsCreationTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		get createAdmin_path
		assert_no_difference 'Admin.count' do
			post admins_path, params: { admin: { name:  "",
			                                 email: "admin@invalid",
			                                 password:              "foo",
			                                 password_confirmation: "bar" } }
		end
		assert_template 'admins/new'
	end
end
