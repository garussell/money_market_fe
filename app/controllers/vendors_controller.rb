class VendorsController < ApplicationController
  def show
    @vendor = MarketMoneyFacade.get_one_vendor(params[:id])
  end
end