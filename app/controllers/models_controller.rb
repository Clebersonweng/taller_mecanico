class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    if params[:search]
      @models = Model.search(params[:search]).order("created_at DESC")
    else
      @models = Model.all.order('created_at DESC')
    end
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
    @brands = Brand.all.collect { |e| [e.brand,e.id]}

  end

  # GET /models/1/edit
  def edit
   @model = Model.find(params[:id])
   @brands = Brand.all.collect { |e| [e.brand,e.id]  }
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
         flash[:success] = "Your model has been create"
          format.html { redirect_to  action:"index"}
      else
        #creamos una variable @brands para el error si se envia vacio
        @brands = Brand.all.collect{|e| [e.brand, e.id]}
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        @brands = Brand.all.collect { |e| [e.brand,e.id]  }
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:brand_id, :model, :description)
    end
end
