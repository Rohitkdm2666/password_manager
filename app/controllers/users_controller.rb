class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)   
        if @user.save
            render json: {message: "user created succesfully"}
            redirect_to @user
        else
            render json: {message: "create user failed"}
        end
    end

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.password == params[:password]
            render json: {message: "login succesfully"}
            redirect_to @user
        else
            render json: {message: "login failed"}
        end
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {message: "user updated succesfully"}
            redirect_to @user
        else
            render json: {message: "update user failed"}
        end
    end
        
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: {message: "user deleted succesfully"}
        else
            render json: {message: "delete user failed"}
        end
    end

    private 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
