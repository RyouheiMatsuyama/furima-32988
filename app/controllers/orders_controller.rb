class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit]
  before_action :set_order_purchase, only: [:index, :new, :create, :edit]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @order_purchase = OrderPurchase.new
  end

  def new
  end

  def create
    @order_purchase = OrderPurchase.new(purchase_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:order_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building,
                                           :phone_number, :purchase).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_order_purchase
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if @item.user_id == current_user.id || !@item.purchase.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
