class ConfirmationsController < Devise::ConfirmationsController
  def registration
    @user = User.find(params[:user_id])
  end

  private

  def after_inactive_sign_up_path_for(resource)
    sign_in(resource)
  end
end
