class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :index_today], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :index_today], unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :birthday, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :birthday, :photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|chatrooms|messages/
  end
end
