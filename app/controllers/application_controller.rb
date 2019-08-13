class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:full_name,
                                             company_attributes: [:affiliation, :name, :category_id,
                                                                  addresses_attributes: [:zip_code,
                                                                                         :city,
                                                                                         :state,
                                                                                         :neighborhood,
                                                                                         :street]]])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:full_name, :avatar, company_attributes: [:id, :category_id]])
  end
end
