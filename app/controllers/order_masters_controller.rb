class OrderMastersController < ApplicationController
  before_action :set_order_master, only: [:show, :edit, :update, :destroy]

  # GET /order_masters
  # GET /order_masters.json
  def index
    @order_masters = OrderMaster.all
  end

  # GET /order_masters/1
  # GET /order_masters/1.json
  def show
  end

  # GET /order_masters/new
  def new
    @order_master = OrderMaster.new
    @clients = Client.all
    @vehicles = Vehicle.all
    @mechanics = Mechanic.all.collect { |e| [e.name,e.id]}
    @replacements = Replacement.all
    @states = State.all
    @type_of_works = TypeOfWork.all
  end

  # GET /order_masters/1/edit
  def edit
  end

  # POST /order_masters
  # POST /order_masters.json
  def create  
    @order_master = OrderMaster.new(order_master_params)
    respond_to do |format|
      if @order_master.save
         flash[:success] = "Your order has been create"
          format.html { redirect_to  action:"index"}
      else
        @clients = Client.all
        @vehicles = Vehicle.all
        @mechanics = Mechanic.all
        @replacements = Replacement.all
        @states = State.all
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_masters/1
  # PATCH/PUT /order_masters/1.json
  def update
        @clients = Client.all
        @vehicles = Vehicle.all
        @mechanics = Mechanic.all
        @replacements = Replacement.all
        @states = State.all
    respond_to do |format|
      if @order_master.update(order_master_params)
        format.html { redirect_to @order_master, notice: 'Order master was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_master }
      else
        format.html { render :edit }
        format.json { render json: @order_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_masters/1
  # DELETE /order_masters/1.json
  def destroy
    @order_master.destroy
    respond_to do |format|
      format.html { redirect_to order_masters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_master
      @order_master = OrderMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_master_params
      params.require(:order_master).permit(:mechanic_id, :vehicle_id, :type_of_work_id, :date, :client_id, :description_problem, :description_work_research, :state_id,
       order_details_attributes: [:replacement_id, :quantity])
    end
end
