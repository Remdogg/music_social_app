class RegistrationsController < Devise::RegistrationsController


def after_sign_up_path_for(resource)
    '/registrations/profile_page' # Or :prefix_to_your_route
end

def profile_page
end


  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password
    #re add in image after paperclip
    # :image
    )
  end



end
