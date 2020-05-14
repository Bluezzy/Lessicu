class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :admin?, :authorize

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user != nil
    end

    def admin?
        logged_in? && current_user.admin
    end

    def authorize
        unless admin?
            redirect_to root_path, flash: { notice: "Réservé aux administrateurs" }
        end        
    end
end
