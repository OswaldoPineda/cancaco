# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    "/confirmations/?user_id=#{resource[:id]}"
  end
end
