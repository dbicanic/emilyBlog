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

	test "valid signup information" do
	    get createAdmin_path
	    assert_difference 'Admin.count', 1 do
	      post admins_path, params: { admin: { name:  "Example admin",
	                                         email: "admin@example.com",
	                                         password:              "password",
	                                         password_confirmation: "password" } }
	    end
	    follow_redirect!
	    assert_template 'admins/show'
	  end
end
