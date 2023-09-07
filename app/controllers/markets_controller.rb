class MarketsController < ApplicationController
  def index
    @markets = MarketMoneyFacade.get_all_markets
  end

  def show
    
  end
end
