class LockCodesController < ApplicationController
  before_action :set_lock_code, only: %i[ show edit update destroy ]

  # GET /lock_codes or /lock_codes.json
  def index
    @lock_codes = LockCode.all
  end

  # GET /lock_codes/1 or /lock_codes/1.json
  def show
  end

  # GET /lock_codes/new
  def new
    @lock_code = LockCode.new
  end

  # GET /lock_codes/1/edit
  def edit
  end

  # POST /lock_codes or /lock_codes.json
  def create
    @lock_code = LockCode.new(lock_code_params)

    respond_to do |format|
      if @lock_code.save
        format.html { redirect_to lock_code_url(@lock_code), notice: "Lock code was successfully created." }
        format.json { render :show, status: :created, location: @lock_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lock_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lock_codes/1 or /lock_codes/1.json
  def update
    respond_to do |format|
      if @lock_code.update(lock_code_params)
        format.html { redirect_to lock_code_url(@lock_code), notice: "Lock code was successfully updated." }
        format.json { render :show, status: :ok, location: @lock_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lock_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lock_codes/1 or /lock_codes/1.json
  def destroy
    @lock_code.destroy

    respond_to do |format|
      format.html { redirect_to lock_codes_url, notice: "Lock code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lock_code
      @lock_code = LockCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lock_code_params
      params.require(:lock_code).permit(:code, :invitation, :property_id, :smart_lock_id)
    end
end
