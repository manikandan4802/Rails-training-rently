require 'byebug'
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy]
  
  # GET /properties or /properties.json
  def index
    # debugger
    @properties = Property.where(agent_id: current_agent.id)
  end
  
  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    # debugger
    @property.company_id=current_agent.company_id
    @property.agent_id=current_agent.id
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    pr = Property.find_by_id params[:id]
    # debugger
    sl=SmartLock.where(property_id: params[:id])
    sl.update(property_id: nil)
    # pr.smart_lock.clear
    pr.lock_codes.clear
    pr.invitations.clear
    pr.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
       format.json { head :no_content }
    end
  end


  def assign_smart_lock
    # debugger
    @smart_locks=SmartLock.where(company_id:current_agent.company_id,property_id: nil)
  end

  def attach_lock_box
    smart_lock=SmartLock.find_by_id(params[:smart_lock][:serial_number])
    smart_lock.update(property_id: params[:id])
    
    for i in 0..9 do
      newcode= rand(10 ** 6)
      lc = LockCode.create(property_id: params[:id], smart_lock_id: smart_lock.id, code: newcode)
    end

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Smart Lock was successfully assigned." }
      format.json { head :no_content }
    end
  end


  def detach_lock_box
    smart_lock=SmartLock.find_by(property_id: params[:id])
    # debugger
    debugger
    smart_lock.update(property_id: nil)
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Smart Lock was successfully detached." }
      format.json { head :no_content }
    end
  end

  private
   
    def set_property
      # debugger
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:property_type, :bhk, :size, :price, :address, :agent_id, :image, :company_id)
    end
end
