class Api::V1::AgentsController < ApplicationController
    before_action :set_agent, only: [ :show, :update, :destroy ] 
  # GET /agents or /agents.json
    def index
        @agents = Agent.all
        render json: @agent
    end
  
    def show
        render json: @agent
    end

    def create
        @agent = Agent.new(agent_params)
        if @agent.save
            render json: @agent
        else
            render errors: {error: 'Unable to create Agent'},status: 400
        end
    end


    def update
        if @agent
            @agent.update(agent_params)
            render json: {message: "Agent was updated"},status: 200
        else
            render errors: {error: 'Unable to update Agent'},status: 400
        end
    end

    def destroy
        if @agent
            @agent.destroy
            render json: {message: "Agent was deleted"},status: 200
        else
            render errors: {error: 'Unable to delete Agent'},status: 400
        end
            
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      # debuggerr
      @agent = Agent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_params
      # debugger
      params.require(:agent).permit(:agent_name, :role, :phone_number, :company_id, :email, :password)
    end
end
