# frozen_string_literal: true
require 'byebug'
class Agents::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def new
    super
  end


  def index
    @agents = Agent.all
  end


  def show
  end


  # POST /resource
    def create
      # super
      # require 'byebug'
      # debugger
      # puts ("***************************************")
      @company = Company.new(permit_company)
      # puts ("values : #{params}")
      
      # @agent=Agent.new(permit_agent)
      # @company.company_name=@agent.company_name
      # @company.admin_name=@agent.agent_name
      @company.company_name=params[:agent][:company_name]
      @company.admin_name=params[:agent][:agent_name]
      @company.save
      params[:agent][:role]="Admin"
      params[:agent][:phone_number]=@company.phone_number
      params[:agent][:company_id]=@company.id
      super
    
    end

    private
    

    def permit_company
      # debugger
      params.require(:agent).permit(:company_name,:admin_name,:phone_number)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :agent_name, :phone_number, :role, :company_id])
    end

    def permit_agent
      params.require(:agent).permit(:email,:password, :agent_name, :phone_number, :company_name)
    end
 
end
