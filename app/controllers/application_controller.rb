class ApplicationController < ActionController::Base
	include Pundit
	include ProjectsHelper

	protect_from_forgery
	protect_from_forgery with: :exception

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

		def user_not_authorized(exception)
			policy_name = exception.policy.class.to_s.underscore

			flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
			redirect_to(root_path)
		end

	protected
		
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
			devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
		end	
end
