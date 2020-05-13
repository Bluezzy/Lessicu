class SessionController < ApplicationController
    def index
    end

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            if admin?
                success_msg = "Connecté(e) en tant qu'administrateur. Bievenue, " + @user.name + "."
            else
                success_msg = "Connecté(e) avec succès. Bievenue, " + @user.name + "."
            end
            redirect_to root_path, flash: { success: success_msg }
        else
            error_msg = "pseudo et/ou mot de passe incorrect(s)"
            redirect_to '/login', flash: { error: error_msg }
        end
    end

    def destroy
        reset_session
        redirect_to '/login', flash: { notice: "Vous êtes déconnecté(e)" }
    end
end
