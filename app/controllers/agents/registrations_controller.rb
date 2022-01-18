# frozen_string_literal: true
require 'byebug'
class Agents::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def new
    # require 'byebug'
    # debugger
  puts ("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
    # @agent = Agent.new
    super
  end


  def index
    @agents = Agent.all
  end


  def show
  end


  # POST /resource
    def create
      # require 'byebug'
      debugger
      puts ("***************************************")
      @company = Company.new(permit_company)
      puts ("values : #{params}")
      
      @agent=Agent.new(permit_agent)
      @company.company_name=@agent.company_name
      @company.admin_name=@agent.agent_name
    #  puts("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
      # respond_to do |format|
        if @company.save
          # require 'byebug'
          # debugger

          @agent=Agent.new(permit_agent)
          @agent.company_id=@company.id
          # @agent.agent_name=@company.admin_name
          @agent.role="Admin"
          @agent.phone_number=@company.phone_number 
          @agent.save!
         # render 'home/header'
          redirect_to properties_path
          # format.html { redirect_to 'home/about' }
          # format.html { redirect_to agent_url(@company.id), notice: "Company was successfully created." }
         
          # format.json { render :show, status: :created, location: @company }
        #else
          # format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @company.errors, status: :unprocessable_entity }
        end
     
      # end
    end

    private
    

    def permit_company
      # debugger
      params.require(:agent).permit(:company_name,:admin_name,:phone_number)
    end

    def permit_agent
      params.require(:agent).permit(:email,:password, :agent_name, :phone_number, :company_name)
    end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
