# frozen_string_literal: true

class Agents::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   # user = Agent.find_by_email(params[:email]) 
  #   # debugger
  #   # if user.valid_password?(params[:password])
  #   #   puts("************************************************************")
  #   # end
  #   # super
  # end

  # DELETE /resource/sign_out
  def destroy
    puts ("2860538296105162659823605168326528365,#{params}")
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
