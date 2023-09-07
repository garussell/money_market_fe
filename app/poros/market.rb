class Market
  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :zip,
              :full_address

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @street = data[:attributes][:street]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @zip = data[:attributes][:zip]
    @full_address = full_address
  end
  
  def full_address
    "#{@street} #{@city}, #{@state} #{@zip}"
  end
end