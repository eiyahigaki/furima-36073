class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @history_delivery = HistoryDelivery.new
  end

  def create
    binding.pry
    @history_delivery = HistoryDelivery.new(history_params)
    if @history_delivery.valid?
      @history_delivery.save
      redirect root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history_delivery).permit(:postal_code, :area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
