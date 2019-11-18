class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:show, :edit, :update, :destroy]

    # def index
    #     @users = User.all
    # end

    def show
        @events = Event.all
        @past_events = @user.get_past_events
        @future_events = @user.get_future_events
        @hosting_past = @user.get_past_host_events
        @hosting_future = @user.get_future_host_events
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def find_user
        @user=User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
