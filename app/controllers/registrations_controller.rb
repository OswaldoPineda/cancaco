# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def new
    @categories = Category.all
    @company = Company.new
    super
  end

  def create
    @categories = Category.all
    super
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    "/confirmations/?user_id=#{resource[:id]}"
  end
end
