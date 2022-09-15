# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from ActiveRecord::RecordNotFound,    with: :route_not_found
  rescue_from ActionController::UnknownFormat, with: :route_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  def record_not_valid
    flash[:alert] = 'You cannot Cast your vote AGAIN.'
    redirect_to(request.referer || root_path)
  end

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :halka_id, :cnic, :avatar, :password_confirmation)
    end
  end
end
