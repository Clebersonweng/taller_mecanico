class ExampleController < ApplicationController
  def edit
  	@order_master = OrderMaster.first
  	@order_master.order_details = [OrderDetail.new]
  end

  def update
  	@order_master = OrderMaster.find(params[:id])
  	@order_master.update_attributes(params[:order_master])
  end

end
