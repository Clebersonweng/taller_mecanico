class InvoiceMastersController < ApplicationController
  before_action :set_invoice_master, only: [:show, :edit, :update, :destroy]

  # GET /invoice_masters
  # GET /invoice_masters.json
  def index
    @invoice_masters = InvoiceMaster.all
  end

  # GET /invoice_masters/1
  # GET /invoice_masters/1.json
  def show
  end

  # GET /invoice_masters/new
  def new
    @invoice_master = InvoiceMaster.new

  end

  # GET /invoice_masters/1/edit
  def edit
  end

  # POST /invoice_masters
  # POST /invoice_masters.json
  def create
    @invoice_master = InvoiceMaster.new(invoice_master_params)

    respond_to do |format|
      if @invoice_master.save
        format.html { redirect_to @invoice_master, notice: 'Invoice master was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_master }
      else
        format.html { render :new }
        format.json { render json: @invoice_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_masters/1
  # PATCH/PUT /invoice_masters/1.json
  def update
    respond_to do |format|
      if @invoice_master.update(invoice_master_params)
        format.html { redirect_to @invoice_master, notice: 'Invoice master was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_master }
      else
        format.html { render :edit }
        format.json { render json: @invoice_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_masters/1
  # DELETE /invoice_masters/1.json
  def destroy
    @invoice_master.destroy
    respond_to do |format|
      format.html { redirect_to invoice_masters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_master
      @invoice_master = InvoiceMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_master_params
      params.require(:invoice_master).permit(:num_invoice, :client_id, :date, :total,invoice_details_attributes:[:type_of_work_id, :invoice_master_id, :order_master_id])
    end
    def calculateNumInvoice
      @numInvoice = OrderMaster.num_invoice.last()
      puts "@numInvoice"
      if(@numInvoice == null)
      end
    end
end
