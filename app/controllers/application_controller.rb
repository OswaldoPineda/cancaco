class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:first_name, :last_name,
                                             company_attributes: [:affiliation, :name, :phone, :cellphone,
                                                                  address_attributes: [:zip_code,
                                                                                       :city,
                                                                                       :state,
                                                                                       :neighborhood,
                                                                                       :street,
                                                                                       :interior_number,
                                                                                       :outdoor_number]]])
  end
end
