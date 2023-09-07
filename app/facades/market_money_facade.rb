class MarketMoneyFacade
  def self.market
    MarketMoneyService.new
  end

  def self.get_all_markets
    markets = market.all_markets

    markets.map do |market|
      Market.new(market[1][0])
    end
  end
end