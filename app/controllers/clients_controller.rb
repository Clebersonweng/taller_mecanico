class ClientsController < ApplicationController
  layout "bootstrap"
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    if params[:search]
      @clients = Client.search(params[:search]).order("created_at DESC")
    else
      @clients = Client.all.order('created_at DESC')
    end
  end
  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end
  

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
   respond_to do |format|
     if @client.valid? 
       if @client.save
          flash[:success] = "Your client has been create"
          format.html { redirect_to  action:"index"}
       else
         render 'edit', flash[:error] = "Unable to update venue"
       end
     else
       format.html { render :new }
       format.json { render json: @client.errors, status: :unprocessable_entity }
     end
   end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to  action:"index", notice: 'Client was successfully updated.' }
        format.json { render :index, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
  @client = Client.find(params[:id])
  @client.destroy

  #redirect_to :action => :index
  respond_to do |format|
    format.html { redirect_to posts_url }
    format.json { head :no_content }
    format.js {render :nothing => false}
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:document, :name, :lastname, :address, :phone)
    end
  end
