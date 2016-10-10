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


def edit
  
  @pictures = @user.pictures
  render :edit

end


def update
    @pictures = @user.pictures
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?

    if resource_updated
          if !params[:picture].nil?
            params[:picture].each do |picture|
              pics = Picture.create(picture: picture)

              self.resource.pictures << pics
            end
          end






      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
end


def picture_params
  params.require(:picture).permit(:user_id)
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
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :age, :gender, :city, :state, :postal_code, :about, :artists, :avatar)
  end



end
