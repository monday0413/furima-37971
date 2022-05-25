class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set
  before_action :move_to_top 

def index
  @order_form = OrderForm.new
end

def create
  # binding.pry
  @order_form = OrderForm.new(order_params)
  if @order_form.valid?
    @order_form.save
    redirect_to root_path
  else
    render :index
  end
end


private

  def order_params
  params.require(:order_form).permit( :price,:post_code, :prefecture_id, :city, :address_number, :building_name,:phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end
  
  def move_to_top
    if @item.user_id == current_user.id
     redirect_to root_path   
   end
  end

  def item_set
    @item = Item.find(params[:item_id])
  end
end