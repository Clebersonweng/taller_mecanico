class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
       if params[:search]
        @vehicles = Vehicle.search(params[:search]).order("created_at DESC")
      else
        @vehicles = Vehicle.all.order('created_at DESC')
      end
  end 
  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @clients = Client.all.collect { |e| [e.name+" "+e.lastname,e.id]  }
    @models = Model.all.collect { |e| [e.model,e.id]  }
    @brands = Brand.all.collect { |e| [e.brand,e.id]  }
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.new
    @clients = Client.all.collect { |e| [e.name+" "+e.lastname,e.id]  }
    @models = Model.all.collect { |e| [e.model,e.id]  }
    @brands = Brand.all.collect { |e| [e.brand,e.id]  }
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
         flash[:success] = "Your model has been create"
          format.html { redirect_to  action:"index"}
      else
        #creamos una variable @brands para el error si se envia vacio
         @clients = Client.all.collect { |e| [e.name+" "+e.lastname,e.id]  }
         @models = Model.all.collect { |e| [e.model,e.id]  }
         @brands = Brand.all.collect { |e| [e.brand,e.id]  }
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :index, status: :ok, location: @vehicle }
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
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:client_id, :model_id, :brand_id, :licencePlate, :year)
    end
end
