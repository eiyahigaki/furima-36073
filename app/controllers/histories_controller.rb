class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root


  def index
    @history_delivery = HistoryDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @history_delivery = HistoryDelivery.new(history_params)
    if @history_delivery.valid?
      pay_item
      @history_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history_delivery).permit(:postal_code, :area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: history_params[:price],
      card: history_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.history.present?
      redirect_to root_path
    end
  end
end
