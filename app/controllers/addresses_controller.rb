class AddressesController < ApplicationController
  before_action :authenticate_user!, :load_company

  def index
    @address = current_user.company.addresses.new
    @addresses = Address.where(company: @company).sort_by(&:created_at)
  end

  def create
    @company.addresses.create(permitted_parameters)
    redirect_to(addresses_path, notice: I18n.t('success.address.added'))
  end

  def update
    address = @company.addresses.find(params[:id])
    address.update(permitted_parameters)
    redirect_to(addresses_path, notice: I18n.t('success.address.updated'))
  end

  def destroy
    address = @company.addresses.find(params[:id])
    address.destroy
    redirect_to(addresses_path, alert: I18n.t('success.address.deleted'))
  end

  private

  def load_company
    @company = Company.find_by(user: current_user)
  end

  def permitted_parameters
    params.require(:address).permit(:zip_code, :state, :city, :neighborhood, :street)
  end
end
