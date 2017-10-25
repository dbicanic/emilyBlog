class AdminsController < ApplicationController

	def show
		@admin = Admin.find(params[:id])
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(adminParams)
		if @admin.save
			flash[:success] = "You have created a new admin."
			redirect_to @admin
		else
			render "new"
		end
	end

	private

	def adminParams
		params.require(:admin).permit(:name, :email, :password, :password_confirmation)
	end
end
