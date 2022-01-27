class SmartLocksController < ApplicationController
  before_action :set_smart_lock, only: %i[ show edit update destroy attach]

  # GET /smart_locks or /smart_locks.json
  def index
    @smart_locks = SmartLock.all
  end

  def home
  end
  
  # GET /smart_locks/1 or /smart_locks/1.json
  def show
  end

  # GET /smart_locks/new
  def new
    @smart_lock = SmartLock.new
  end

  # GET /smart_locks/1/edit
  def edit
  end

  # POST /smart_locks or /smart_locks.json
  def create
    @smart_lock = SmartLock.new(smart_lock_params)

    respond_to do |format|
      if @smart_lock.save
        format.html { redirect_to smart_lock_url(@smart_lock), notice: "Smart lock was successfully created." }
        format.json { render :show, status: :created, location: @smart_lock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @smart_lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smart_locks/1 or /smart_locks/1.json
  def update
    respond_to do |format|
      if @smart_lock.update(smart_lock_params)
        format.html { redirect_to smart_lock_url(@smart_lock), notice: "Smart lock was successfully updated." }
        format.json { render :show, status: :ok, location: @smart_lock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @smart_lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smart_locks/1 or /smart_locks/1.json
  def destroy
    @smart_lock.destroy

    respond_to do |format|
      format.html { redirect_to smart_locks_url, notice: "Smart lock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  



  private

    def set_smart_lock
      @smart_lock = SmartLock.find(params[:id])
    end

    def smart_lock_params
      params.require(:smart_lock).permit(:serial_num, :company_id, :property_id)
    end
end
