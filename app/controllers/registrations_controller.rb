class RegistrationsController < Devise::RegistrationsController
  # to include get_unread_count
  include ApplicationHelper
  #counts unread emails in current user inbox
  before_action :get_unread_count

def after_sign_up_path_for(resource)
    '/users/edit' # Or :prefix_to_your_route
end

def after_update_path_for(resource)

end


    protected

    def update_resource(resource, params)
      if current_user.provider == "facebook"
        params.delete("current_password")
        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end



  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :age, :gender, :city, :state, :postal_code, :about, :artists, :avatar
    #re add in image after paperclip
    # :image
    )
  end



end
