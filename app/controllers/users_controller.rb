class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to '/menus'
	end
	def create
	@user = User.new(user_params) 
		if @user.save 
			session[:user_id] = @user.id 
			redirect_to '/menus' 
		else 
			redirect_to '/signup' 
		end
	end
	def update
  @user = User.find(params[:id])
	  if @user.update(user_params)
	    redirect_to '/menus'
	  else
	    render 'edit'
	  end
	end
	def show
		@user = User.find(params[:id])
	end
	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :phone, :address)
		end
end
