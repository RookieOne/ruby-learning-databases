# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

name = gets
p name

# start the largest order as empty and amount at 0
largest_order = nil
largest_order_amount = 0

# read each order line by line
text.each_line do |line|
  # replace the new line character with nothing
  line = line.gsub("\n", "")
  # split line by comma to get order values in an array
  order = line.split(",")
  # customer name - 0
  # phone number - 1
  # shirt name - 2
  # order amount - 3
  order_amount = order[3].to_i

  if order_amount > largest_order_amount
    largest_order = order
    largest_order_amount = order_amount
  end
end

puts "The Largest Order is from #{largest_order[0]}"
puts "The Largest Order amount is #{largest_order[3]}"