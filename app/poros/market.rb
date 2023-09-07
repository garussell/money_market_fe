class Market
  attr_reader :name,
              :city,
              :state,
              :id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
  end
end