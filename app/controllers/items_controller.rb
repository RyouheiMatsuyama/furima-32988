class ItemsController < ApplicationController
  
  def index
    @items = Item.order("created_at DESC")
    #@items = Item.includes(:user)
    #@item = Item.find(params[:item_id])
      #if current_user == @item.user
        #redirect_to root_path
      #end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
    render :new
    end
  end

  def show
    #@items = current_user.
  end

  private

  def item_params
  params.require(:item).permit(:name, :explanation, :details_category_id, :details_state_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
