class PasswordsController < ApplicationController
    def index
        @password = Password.new
        @user_id = params[:id]
        @passwords = Password.where(user_id: @user_id)
    end
    
    def create
        @password = Password.new(password_params)
        if @password.save
            redirect_to passwords_index_path(id: @password.user_id), notice: 'Password was successfully created.'
        else
            render :index
        end
    end

    def destroy
        @password = Password.find(params[:id])
        if @password.destroy
            redirect_to passwords_index_path(id: @password.user_id), notice: 'Password was successfully deleted.'
        else
            redirect_to passwords_index_path(id: @password.user_id), alert: 'Failed to delete password.'
        end
    end

    private
    def password_params
        params.require(:password).permit(:user_id,:username,:password, :website_url, :website_name)
    end
    

end
