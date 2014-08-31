class ReplacementsController < ApplicationController
  before_action :set_replacement, only: [:show, :edit, :update, :destroy]

  # GET /replacements
  # GET /replacements.json
  def index
   if params[:search]
      @replacements = Replacement.search(params[:search]).order("created_at DESC")
    else
      @replacements = Replacement.all.order('created_at DESC')
    end
  end

  # GET /replacements/1
  # GET /replacements/1.json
  def show
  end

  # GET /replacements/new
  def new
    @replacement = Replacement.new
  end

  # GET /replacements/1/edit
  def edit
  end

  # POST /replacements
  # POST /replacements.json
  def create
    @replacement = Replacement.new(replacement_params)

    respond_to do |format|
      if @replacement.save
        format.html { redirect_to @replacement, notice: 'Replacement was successfully created.' }
        format.json { render :index, status: :created, location: @replacement }
      else
        format.html { render :new }
        format.json { render json: @replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replacements/1
  # PATCH/PUT /replacements/1.json
  def update
    respond_to do |format|
      if @replacement.update(replacement_params)
        format.html { redirect_to @replacement, notice: 'Replacement was successfully updated.' }
        format.json { render :index, status: :ok, location: @replacement }
      else
        format.html { render :edit }
        format.json { render json: @replacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replacements/1
  # DELETE /replacements/1.json
  def destroy
    @replacement.destroy
    respond_to do |format|
      format.html { redirect_to replacements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replacement
      @replacement = Replacement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def replacement_params
      params.require(:replacement).permit(:name, :brand, :purchasePrice, :salePrice, :description)
    end
end
