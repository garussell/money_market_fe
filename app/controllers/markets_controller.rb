class MarketsController < ApplicationController
  def index
    @markets = MarketMoneyFacade.get_all_markets
  end

  def show
    @market = MarketMoneyFacade.get_one_market(params[:id])
    @vendors = MarketMoneyFacade.get_all_vendors_for_one_market(params[:id])
  end
end
