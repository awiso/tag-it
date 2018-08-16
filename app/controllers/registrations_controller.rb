class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :display_name, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:email, :display_name, :password, :password_confirmation, :avatar, :current_password)
  end
end