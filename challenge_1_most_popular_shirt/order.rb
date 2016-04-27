class Order
  attr_accessor :customer_name
  attr_accessor :phone_number
  attr_accessor :shipping_address
  attr_accessor :shirt_name
  attr_accessor :shirt_size
  attr_accessor :order_amount
  attr_accessor :shipping_date

  def initialize(line)
    data = line.gsub("\n", "").split(",")
    @customer_name = data[0]
    @phone_number = data[1]
    @shipping_address = data[2]
    @shirt_name = data[3]
    @shirt_size = data[4]
    @order_amount = data[5].to_i
    @shipping_date = data[6]
  end

  def self.read_from_csv(filename)
    file = File.open("small.csv")
    text = file.read
    orders = []
    text.each_line do |line|
      orders << Order.new(line)
    end
    orders
  end

end