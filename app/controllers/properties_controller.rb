require 'byebug'
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy attach detach]
  $flag=0
  # GET /properties or /properties.json
  def index
    # debugger
    # puts("899873479390479070950973052-15097598179827")
    # debugger
    @properties = Property.all
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
    # @property.company_id=current_agent.company_id
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
    pr.lock_codes.clear
    pr.invitations.clear
    pr.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
       format.json { head :no_content }
    end
  end

  def attach 
    if $flag==0
      sl=SmartLock.where(assigned: false).first
      sl.update(property_id: @property.id,company_id:current_agent.company_id, assigned: true)
      respond_to do |format|
        format.html { redirect_to properties_url, notice: "Smart Lock was successfully assigned." }
        format.json { head :no_content }
      end
      $flag=1
    else
      respond_to do |format|
        format.html { redirect_to properties_url, notice: "SmartLock Already attached" }
         format.json { head :no_content }
      end
    end
  end


  def detach
    if $flag==1
      dl=@property.smart_lock
      dl.update(assigned: false, property_id:20,company_id: 10)
      respond_to do |format|
        format.html { redirect_to properties_url, notice: "Smart Lock was successfully detached." }
        format.json { head :no_content }
      end
      $flag=0
    else
      respond_to do |format|
        format.html { redirect_to properties_url, notice: "SmartLock is empty" }
         format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:property_type, :bhk, :size, :price, :address, :agent_id, :image)
    end
end
