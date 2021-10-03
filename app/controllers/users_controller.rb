class UsersController < ApplicationController
    def new
    end
    
    def home
    end

    def create
        @user = User.create(user_params)
        if @user.password != user_params[:password_confirmation]
            redirect_to new_user_path
        else
            session[:user_id] = @user.id
        end
        # byebug
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
# users POST /users(.:format)     users#create
# new_user GET  /users/new(.:format) users#new
#    login GET  /login(.:format)     sessions#new
#          POST /login(.:format)     sessions#create