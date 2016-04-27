require "./order.rb"

shirts = {}

Order.read_from_csv("small.csv").each do |order|
  if shirts[order.shirt_name] == nil
    shirts[order.shirt_name] = 0
  end
  shirts[order.shirt_name] = shirts[order.shirt_name] + order.order_amount
end

most_popular_shirt = nil
most_popular_shirt_amount = 0

shirts.each do |shirt_name, amount|
  if amount > most_popular_shirt_amount
    most_popular_shirt = shirt_name
    most_popular_shirt_amount = amount
  end
end

puts "The Most Popular Shirt is #{most_popular_shirt}"
puts "The Most Popular Shirt was ordered #{most_popular_shirt_amount} times"