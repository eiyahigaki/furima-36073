class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @history_delivery = HistoryDelivery.new
  end
end
