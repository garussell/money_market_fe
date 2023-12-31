class MarketMoneyFacade
  def self.market
    MarketMoneyService.new
  end

  def self.get_all_markets
    markets = market.all_markets
    markets[:data].map do |data|
      Market.new(data)
    end
  end

  def self.get_one_market(market_id)
    one_market = market.one_market(market_id)
    Market.new(one_market[:data])
  end

  def self.get_all_vendors_for_one_market(market_id)
    vendors = market.all_vendors_for_one_market(market_id)
    vendors[:data].map do |data|
      Vendor.new(data)
    end
  end

  def self.get_one_vendor(vendor_id)
    one_vendor = market.one_vendor(vendor_id)
    Vendor.new(one_vendor[:data])
  end
end