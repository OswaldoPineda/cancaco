# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :set_errors

  def new
    @categories = Category.all
    build_resource({})
    set_minimum_password_length
    resource.build_company
    resource.company.build_address
    yield resource if block_given?
    respond_with resource
  end

  def create
    @categories = Category.all
    super
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    "/confirmations/?user_id=#{resource[:id]}"
  end

  def set_errors
    @error_messages = []
  end
end
