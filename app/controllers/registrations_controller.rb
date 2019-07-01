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

  def edit
    @categories = Category.all
    @company = Company.new
    super
  end

  def update
    @categories = Category.all
    @company = Company.new
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    resource_updated = resource.update_with_password(account_update_params)
    if resource_updated
      set_flash_message :notice, :updated
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    "/confirmations/?user_id=#{resource[:id]}"
  end

  def set_errors
    @error_messages = []
  end
end
