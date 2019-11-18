class ApplicationController < ActionController::Base
helper_method :current_user, :logged_in?, :require_login


    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_login
        if !logged_in?
            #flash an error message
            redirect_to login_path
        end
    end

end
