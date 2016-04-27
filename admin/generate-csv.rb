require "faker"

filename = ARGV[0] || "data.csv"
order_number = (ARGV[1] || 10).to_i

Faker::Config.locale = 'en-US'

def generate_shirt_name
  ["Harry Potter", "Capt America", "Prince", "Star Wars", "Cowboys"].sample
end

def generate_shirt_size
  ["Large", "Medium", "Small"].sample
end

def generate_address
  street_address = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip_code
  "#{street_address} #{city} #{state} #{zip}"
end

def generate_phone_number
  "(#{Faker::Number.number(3)}) #{Faker::Number.number(3)}-#{Faker::Number.number(4)}"
end

def generate_order
  customer_name = Faker::Name.name
  phone_number = generate_phone_number
  shipping_address = generate_address
  shirt_name = generate_shirt_name
  shirt_size = generate_shirt_size
  order_amount = Faker::Number.between(1, 500)
  shipping_date = Faker::Time.between(DateTime.now, DateTime.now + 50)
  [customer_name, phone_number, shipping_address, shirt_name, shirt_size, order_amount, shipping_date]
end

file = File.new(filename, "w+")
order_number.times do
  order = generate_order
  output = order.join(",") + "\n"
  file.write(output)
end
file.close

p "DONE"