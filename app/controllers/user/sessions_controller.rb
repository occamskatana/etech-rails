<<<<<<< HEAD
# class User::SessionsController < Devise::SessionsController
#  respond_to :json, :html
  
#   def create
#     sign_out(:user) if current_user
#     self.resource = warden.authenticate!(auth_options)
#     set_flash_message(:notice, :signed_in) if is_flashing_format?
#     sign_in(resource_name, resource)
#     yield resource if block_given?
#       respond_with resource, location: after_sign_in_path_for(resource)
#   end
# end
=======
class User::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end



>>>>>>> 45c3d99c9c787f80c5571cd627f127e364473bda
