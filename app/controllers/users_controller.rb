class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def login
      @user_id = params[:id]
  end

  def process_login
      @user = User.find(params[:id])
      if @user.password == params[:password]
        redirect_to passwords_index_path(id: @user.id), notice: 'Login successful.'
      else
        flash.now[:alert] = 'Invalid password. Please try again.'
        render :login
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
