class Api::V1::PropertiesController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_property, only: [ :show, :update, :destroy ] 
  # GET /propertys or /propertys.json
    def index
        @properties = Property.all
        # debugger
        render json: @properties
    end
  
    def show
        render json: @property
    end
    # def new
    #     puts ("Indian")
    #     # debugger
    #     @property = Property.new
    # end

    def create
        @property = Property.new(property_params)
        # respond_to do |format|
        #     if @property.save
        #       format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        #       format.json { render :show, status: :created, location: @property }
        #     else
        #       format.html { render :new, status: :unprocessable_entity }
        #       format.json { render json: @property.errors, status: :unprocessable_entity }
        #     end
        #   end
        if @property.save
            render json: @property
        else
            render errors: {error: 'Unable to create property'},status: 400
        end
    end


    def update
        if @property
            @property.update(property_params)
            render json: {message: "property was updated"},status: 200
        else
            render errors: {error: 'Unable to update property'},status: 400
        end
    end

    def destroy
      # debugger
      pr = Property.find_by_id params[:id]
      pr.lock_codes.clear
      pr.invitations.clear
      pr.destroy
        if @property
            @property.destroy
            render json: {message: "property was deleted"},status: 200
        else
            render errors: {error: 'Unable to delete property'},status: 400
        end
            
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
        @property = Property.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def property_params
        params.require(:property).permit(:property_type, :bhk, :size, :price, :address, :agent_id)
      end
end
