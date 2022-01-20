class AgentsController < ApplicationController
  before_action :authenticate_agent!
  before_action :set_agent, only: %i[ show edit update destroy ]

  def destroy
    @agent= Agent.find_by_id params[:id]
    @agent.destroy

    respond_to do |format|
      format.html { redirect_to agents_url, notice: "Agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  # GET /agents or /agents.json
  def index
    @agents = Agent.all
  end

  # GET /agents/1 or /agents/1.json
  def show
  end

  # GET /agents/new
  def new
    @agent = Agent.new
    puts "Welcome to India #{params}"
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents or /agents.json
  def create
    @agent = Agent.new(agent_params)
    # debugger
    @agent.company_name=current_agent.company_name
    @agent.company_id=current_agent.company_id
    puts "Welcome to Home #{params}"
    respond_to do |format|
      if @agent.save
        format.html { redirect_to agent_url(@agent), notice: "Agent was successfully created." }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1 or /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to agent_url(@agent), notice: "Agent was successfully updated." }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1 or /agents/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      # debuggerr
      @agent = Agent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_params
      # debugger
      params.require(:agent).permit(:agent_name, :company_name, :role, :phone_number, :company_id, :email, :password)
    end
end
