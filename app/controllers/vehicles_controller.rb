class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  
#  helper_method :sort_column, :sort_direction

  # GET /vehicles
  # GET /vehicles.json
# couldn't get this to work -- search
#  def index
#    if params[:search].present?
#       @vehicles = Vehicle.new(query: params[:search]).results
#    else 
#       @vehicles = Vehicle.order(sort_column + " " + sort_direction)
#    end
#  end  , :conditions => ['desc LIKE ?', "%#{params[:search]}%"])
  
  def index
   @search = Vehicle.search(params[:q])
   if :q
     @vehicles = @search.result
     @search.build_condition
   else
     @vehicles = Vehicle.all  
   end
  
#    if @search
#       @vechicles = @search.result
#    else
#      @vehicles = Vehicle.all
#    end

#     created a search dialog box -- replaced with ransack
#     if params[:search]
#        @vehicles = Vehicle.where(vehicle: params[:search])
#     else
#        @vehicles = Vehicle.all
#     end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    Vehicle.import(params[:file])
    redirect_to root_url , notice: "Vehicle records imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
       params.require(:vehicle).permit(:vehicle, :date, :desc, :mileage, :category, :cost)
#       params.permit(:vehicle, :date, :desc, :mileage, :category, :cost)
    end
    
#   learned how to add sort and direction links -- replaced with ransak gem
#    def sort_column
#      Vehicle.column_names.include?(params[:sort]) ? params[:sort] : "vehicle"
#    end
#    
#    def sort_direction
#      %w[asc desc].include?(params[:direction])? params[:direction] : "asc"
#    end
end
