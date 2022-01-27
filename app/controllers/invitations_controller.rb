class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ show edit update destroy ]
  before_action :assign_lockcode, only: %i[create]
 
  # GET /invitations or /invitations.json
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1 or /invitations/1.json
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations or /invitations.json
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.agent_id=current_agent.id
    @invitation.property_id = @property.id
    @lock_code = @property.lock_codes.where("invitation": true).last
    if @property.smart_lock.present?
      if @lock_code.present?
      # debugger
        @invitation.lock_code_id= @lock_code.id
        @lock_code.update("invitation": false)
      end

      respond_to do |format|
        if @invitation.save
          # format.InviteMailer.with(agent: current_agent, invitation: @invitation).invite_created.deliver_later
          format.html { redirect_to invitation_url(@invitation), notice: "Invitation was successfully created." }
         
          format.json { render :show, status: :created, location: @invitation }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @invitation.errors, status: :unprocessable_entity }
        end
      end

    else
      
      respond_to do |format|
        format.html { redirect_to properties_url, notice: "Invitation was not created.Add Smart Lock and codes" }
      end
    end
   
  end

  # PATCH/PUT /invitations/1 or /invitations/1.json
  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to invitation_url(@invitation), notice: "Invitation was successfully updated." }
        
        format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1 or /invitations/1.json
  def destroy
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url, notice: "Invitation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def assign_lockcode
    # debugger
    # @smart_lock= SmartLock.
    smart_lock=SmartLock.where(property_id: params[:invitation][:property_id]).last
    count=LockCode.where(invitation: true,property_id: params[:invitation][:property_id],smart_lock_id: smart_lock.id).count
    if(count>0)
      @property = Property.find_by_id(params[:invitation][:property_id])
      @lock_code = @property.lock_codes.where("invitation": true).last
      @lock_code.update(:invitation => false)
    else  
      for i in 0..9 do
        newcode= rand(10 ** 6)
        lc = LockCode.create(property_id: @property.id, smart_lock_id: smart_lock.id, code: newcode)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.require(:invitation).permit(:id, :recipient_name, :recipient_email, :agent_id, :property_id, :lock_code_id, :smart_lock)
    end
end