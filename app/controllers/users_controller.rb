class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :check_admin, only: [:index]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
		@user = User.new(user_params)
		@user.skip_confirmation!
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
  end

  def edit
		@user = User.find(params[:id])
  end

  def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
  end

  def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
  end

  private
  
	def user_params
    params.require(:user).permit(:name,:email,:phone_number,:role)
  end

  # def check_admin
  #   unless current_user && current_user.admin?
  #     redirect_to root_path, alert: 'You do not have permission to access this page.'
  #   end
  # end
end
