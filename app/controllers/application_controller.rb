class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone_number, :description, :street, :city, :zipcode])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone_number, :description, :street, :city, :zipcode])
  end

  after_action :verify_authorized, except: [ :index, :show ], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [ :index, :show ], unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^pages$)/
  end
end
