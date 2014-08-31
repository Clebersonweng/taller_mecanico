class TypeOfWorksController < ApplicationController
  before_action :set_type_of_work, only: [:show, :edit, :update, :destroy]

  # GET /type_of_works
  # GET /type_of_works.json
  def index
    @type_of_works = TypeOfWork.all
  end

  # GET /type_of_works/1
  # GET /type_of_works/1.json
  def show
  end

  # GET /type_of_works/new
  def new
    @type_of_work = TypeOfWork.new
  end

  # GET /type_of_works/1/edit
  def edit
  end

  # POST /type_of_works
  # POST /type_of_works.json
  def create
    @type_of_work = TypeOfWork.new(type_of_work_params)

    respond_to do |format|
      if @type_of_work.save
        flash[:success] = "Your type of work has been create"
        format.html { redirect_to  action:"index"}
      else
        format.html { render :new }
        format.json { render json: @type_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_works/1
  # PATCH/PUT /type_of_works/1.json
  def update
    respond_to do |format|
      if @type_of_work.update(type_of_work_params)
        flash[:success] = "Your type of work has been create"
        format.html { redirect_to  action:"index"}
      else
        format.html { render :edit }
        format.json { render json: @type_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_works/1
  # DELETE /type_of_works/1.json
  def destroy
    @type_of_work.destroy
    respond_to do |format|
      flash[:success] = "Your type of work has been delete"
      format.html { redirect_to  action:"index"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_work
      @type_of_work = TypeOfWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_work_params
      params.require(:type_of_work).permit(:typeWork, :price, :description)
    end
end
