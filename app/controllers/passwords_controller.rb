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

    def edit
        @password = Password.find(params[:id])
        @histories = PasswordHistory.where(password_id: @password.id).order(created_at: :desc)
    end
    def update
        @password = Password.find(params[:id])
        old_password = @password.password
        new_password = params[:password][:new_password]

        if @password.update(password: new_password)
            PasswordHistory.create!(
            password_id: @password.id,
            old_password: old_password,
            new_password: new_password
            )
            redirect_to passwords_index_path(id: @password.user_id), notice: 'Password was successfully updated.'
        else
            @histories = PasswordHistory.where(password_id: @password.id).order(created_at: :desc)
            render :edit
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
