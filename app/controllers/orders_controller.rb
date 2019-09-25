class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def destroy
  end

  def create
    @item = Item.find params[:order][:item_id]
    order = current_user.orders.required.create(amount: 1)
    order.item = @item
    redirect_to root_path, notice: "구매 요청되었습니다."
  end


end
