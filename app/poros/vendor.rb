class Vendor
  attr_reader :id,
              :name,
              :contact_name,
              :phone,
              :credit_accepted,
              :description

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @contact_name = data[:attributes][:contact_name]
    @phone = data[:attributes][:contact_phone]
    @credit_accepted = translate_credit_accepted(data)
    @description = data[:attributes][:description]
  end

  def translate_credit_accepted(data)
    if data[:attributes][:credit_accepted]
      "YES"
    else
      "NO"
    end
  end
end