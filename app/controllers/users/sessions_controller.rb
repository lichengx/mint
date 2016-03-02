class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  include SimpleCaptcha::ControllerHelpers
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if simple_captcha_valid?
      super
      @session = resource # Needed for Merit / Must be AFTER the super
    else
      self.resource = resource_class.new(sign_in_params)
      sign_out
      flash[:alert] = "Captcha code is wrong, try again."
      respond_with_navigational(resource) { render :new }
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
