class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :move_to_root

  def index
    @history_delivery = HistoryDelivery.new
  end

  def create
    @history_delivery = HistoryDelivery.new(history_params)
    if @history_delivery.valid?
      pay_item
      @history_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if @item.history.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def history_params
    params.require(:history_delivery).permit(:postal_code, :area_id, :city, :address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end

end
