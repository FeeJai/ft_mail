class UsersController < ApplicationController
    before_action :require_admin

    def index
        @admins = User.where(admin: true)
    end
    
    private

    def require_admin
        unless user_signed_in? && current_user.admin?
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path
        end
    end
end
