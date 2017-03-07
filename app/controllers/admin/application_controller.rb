# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController

    before_action :configure_permitted_parameters, if: :devise_controller?

    def authenticate_admin
      unless current_user and accessible
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:current_password, :email, :password, :password_confirmation, :name, :score, :is_admin)}
    end


    private
    def accessible
      current_user.is_admin
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
