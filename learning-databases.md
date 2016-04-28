Introduction to CSVs and File Databases
======

# Introduction

The original computer programs couldn't store any data. These monolithic monsters the size of rooms could only provide immediate computation based on the data passed in much like simple calculators. There quickly became a need to be able to store data for a computer to process at a later date. At first this was done through the use of punch cards (think Scantrons). As the data being collected grew, this method became unwieldy. Who wants to keep track of boxes of cards?

Computers soon had tape drives and hard drives allowing them to write data down into digital files. Programs could then access these files, do computations, and generate reports.

Lets explore how that worked and how we can use Ruby to process files to help run a business.

# Introduction to CSVs

## The Problem

Your friend Danielle recently decided to chase her dream and open her own T-Shirt printing business. No surprise to her friends and family, the business has caught on and is becoming a big success.

Business is so good, Danelle asked you to come help her keep track of her orders so she can focus on making awesome T-Shirts.

## The Spreadsheet Solution

Her previous record keeping was on a sheet of paper (and sometimes scraps of paper) around the office desk. When people called to place an order, Danelle would record: Customer Name, Phone Number, Shipping Address, Shirt Name, Shirt Size, Order Amount, Order Date, Shipping Date. When an order shipped, she would put a check next to the order line.

First thing you decide is that this analog paper recording keeping has to go. Instead of writing orders down on paper, you use a spreadsheet on your computer.

Across the top you write the type of information you will record for each order. Each of these are the columns in your spreadsheet.

### Picture of Spreadsheet with columns

Then as you answer the phone to receive orders or Danielle hands you notes from sales she made, you enter the information into the spreadsheet. Each order you write is a row in your spreadsheet.

### Picture of Spreadsheet with some rows

When an order ships, you go back to your spreadsheet and enter 'Yes' at the end of the row under a column you made called Shipped.

This system works great! Danelle is happy because she has less paperwork and the desk is now clear of paper. 

## Hello CSVs

Months go by and everything runs like clockwork. Orders come in. T-Shirts ship out. Business is booming.

One Friday afternoon after the last order was shipped, Danielle and you were sitting back drinking some beer and chatting about how great things have been. Danielle was feeling thankful for the business and wanted to give back to her customers. She wanted write a thank you to the customer with the largest order.

You wanted to suprise Danelle and have that information for her on Monday. That weekend you decided that since you have been learning Ruby, maybe you can use Ruby to get her that information.

While Ruby can read spreadsheets, like many other programming languages it is easier for Ruby to read files in a CSV format.

CSV stands for Comma Separate Values. A CSV file has data stored in rows whose columns are separated by commas.

A spreadsheet like this:

### Picture of Spreadsheet

Exports to a CSV file that looks like this:

### Picture of CSV file

## The Largest Order

Before you process the large file of orders to find the largest order, you wanted to make sure your program works. In a separate spreadshet you copy 10 orders down. Reviewing the orders you can easiliy see that the COMPANY NAME order is the largest.

Now time to write your ruby program.

Let's create a new file and call our ruby script `find_largest_order.rb`.

The CSV file we will be reading can be found here [LINK TO CSV]. Be sure to place the CSV file in your project's folder.

Our project's folder directory should look like:

```
/
  find_largest_order.rb
  orders.csv
```

Now its time to code some Ruby to read the csv file and place its contents in a variable. We can call this variable anything, but naming it `text` communicates its purpose to future developers reading this program.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read
```

Lets output the value of `text` to the console. 

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read
puts text
```

We should see the contents of the `text` variable. It should look like the following.

```
"Gilberto Jenkins,(645) 814-8873,8250 Kade Club Stiedemannburgh WA 20027,Prince,Small,401,2016-06-08 00:18:44 -0500\nMiss Corene Sauer,(605) 323-4358,788 Terrell River Lake Reuben GA 77383-1492,Harry Potter,Small,69,2016-06-05 12:15:08 -0500\n ....
```

Notice the values are separated by commas (remember CSV stands for Comma Separated Values). The other important part of this file might be hard to see at first. Look through the output for `\n`s. Computers deal with compact streams of data meaning they don't care about whitespace or readability. `\n` is the fancy character meaning new line.

So if you had a file that contained:

```
What the hell
is a new line
character
```

It would be read in as:

```
What the hell\nis a new line\ncharacter
```

The `\n` new line character is what allows us to be able to read the file line by line.

```
# read each order line by line
text.each_line do |line|
  puts line
end
```

Each order should come back as a line in the file.

```
Gilberto Jenkins,(645) 814-8873,8250 Kade Club Stiedemannburgh WA 20027,Prince,Small,401,2016-06-08 00:18:44 -0500
```

Right now this line is just a large string. We want to be able to access the different parts of the order independently. In order to do this, we need to `split` the values on a comma.

Split works by converting a string into an array of values splitting the values by the string paramter.

```
$ irb
> "Split,is,neat".split(",")
=> ["Split", "is", "neat"]
> "WorksRUBYwithRUBYwithoutRUBYcommas".split("RUBY")
=> ["Works", "with", "without", "commas"] 
```

Back to our `find_largest_order.rb` program.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

# read each order line by line
text.each_line do |line|
  # split line by comma to get order values in an array
  order = line.split(",")
  puts order
end
```

When we run our Ruby program now we should see the orders in the console as arrays of values.

```
["Gilberto Jenkins", "(645) 814-8873", "8250 Kade Club Stiedemannburgh WA 20027", "Prince", "Small", "401", "2016-06-08 00:18:44 -0500\n"]
...
```

Oh look... Mr `\n` is there in our data. We don't want that added to the end of every shipping date. Lets remove the `\n` from our data.

We can remove characters from a string using `gsub`.

```
$ irb
> "Hello World".gsub("Hello", "Hi")
=> "Hi World"
> "Get rid of that new line \ninterloper\n".gsub("\n", "")
=> "Get rid of that new line interloper" 
```

Back in our `find_largest_order.rb` program, we can replace the `\n` in our order using `gsub` before we use `split`.

```
# read each order line by line
text.each_line do |line|
  # replace the new line character with nothing
  line = line.gsub("\n", "")
  # split line by comma to get order values in an array
  order = line.split(",")
  puts order
end
```

Now our orders should look like:

```
["Gilberto Jenkins", "(645) 814-8873", "8250 Kade Club Stiedemannburgh WA 20027", "Prince", "Small", "401", "2016-06-08 00:18:44 -0500"]
...
```

We need to now find the order amount for each order. The order array always has the values in the same order. Recall that the columns in our spreadsheet were: Customer Name, Phone Number, Shipping Address, Shirt Name, Shirt Size, Order Amount, Shipping Date. Since arrays in Ruby start at index 0, we can identify where each column's data is in each order row by writing down the index and the column name in order.

```
# customer name - 0
# phone number - 1
# shipping address - 2
# shirt name - 3
# shirt size - 4
# order amount - 5
# shipping date - 6
order_amount = order[5]
```

Now we can update our program to print all the order amounts.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

# read each order line by line
text.each_line do |line|
  # replace the new line character with nothing
  line = line.gsub("\n", "")
  # split line by comma to get order values in an array
  order = line.split(",")
  # customer name - 0
  # phone number - 1
  # shipping address - 2
  # shirt name - 3
  # shirt size - 4
  # order amount - 5
  # shipping date - 6
  customer_name = order[0]
  order_amount = order[5]
  puts "#{customer_name} - #{order_amount}"
end
```

When we run the program, we can see the orders with the customer name and order amount.

```
Gilberto Jenkins - 401
Miss Corene Sauer - 69
Avis Keebler MD - 89
Loyal Fay - 350
Emely Nienow Jr. - 460
Dr. Ana Rogahn - 388
Reuben Corwin V - 367
Breanna Funk - 127
Will Morissette - 489
Darrel Morar - 41
```

We accomplished the first big step, reading the file and accessing the order data. Our next task is to add logic to identify the order with the largest amount.

We first need a variable to keep track of the largest order we have found so far. We also need a variable to keep track of the largest order amount. We will start the largest order amount at 0.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

# start the largest order as empty and amount at 0
largest_order = nil
largest_order_amount = 0

# read each order line by line
text.each_line do |line|
...
end
```

Now lets think how we want the logic to work. Every order we want to check if the order amount is greater than the current largest order amount. If the order amount is greater than the largest order amount, then we want to make that order the new largest order. Following this pattern (or algorithm) we should be able to identify the largest order after we go through each order.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

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
  # shipping address - 2
  # shirt name - 3
  # shirt size - 4
  # order amount - 5
  # shipping date - 6
  order_amount = order[5]

  if order_amount > largest_order_amount
    largest_order = order
    largest_order_amount = order_amount
  end
end

# print the results
puts "The Largest Order is from #{largest_order[0]}"
puts "The Largest Order amount is #{largest_order[5]}"
```
Lets see if that works.

Oh no! We got an error.

```
`>': comparison of String with 0 failed (ArgumentError)
```

What is happening is the order amount we read from the file isn't a number. It is actually a string. `234` is not the same thing in Ruby as `"234"`. So when we tried to compare `"401"` to `0` using `>`, Ruby couldn't do it so threw an error. What we need to do is convert `"401"` to `401`. We can convert a string to an integer using the `to_i` method.

```
$ irb
> "401".to_i
401
```

Lets update our code to convert the order amount.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

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
  # shipping address - 2
  # shirt name - 3
  # shirt size - 4
  # order amount - 5
  # shipping date - 6
  order_amount = order[5].to_i

  if order_amount > largest_order_amount
    largest_order = order
    largest_order_amount = order_amount
  end
end

puts "The Largest Order is from #{largest_order[0]}"
puts "The Largest Order amount is #{largest_order[5]}"

```

And with our final logic in place, we run our Ruby program and see our results.

```
$ ruby find_largest_order.rb 
The Largest Order is from Will Morissette
The Largest Order amount is 489
```

Woot! It works! Please enjoy your Dr. Frankenstein moment. Let your inner mad scientist out for a bit.

On Monday you shared your Ruby program with Danielle and shared the customer information for the largest order. She is ecstatic! The success of your Ruby program to process the orders sparks tons of ideas and you both brainstorm on other uses.

### Challenge: The Most Popular Shirt

You both wonder outloud what the most popular shirt you sale is. Grabbing your laptop, you decide to make a Ruby program to find out.

Like before, you decide to make a separate spreadsheet first to make sure your program works before you processed the large order file.

- provide small data set
- provide large data set

## The Customer Report

Danielle came into the office this morning and asked if you could use Ruby to generate a report for any customer. She would use the report to review a customer's orders when doing a sales call. 

RUBY PROGRAM TO FILTER BY CUSTOMER NAME AND RETURN ORDERS

### Challenge: The Great Customer Discount

After generating the report for Danelle a few times, you ask her why she wants the report. Danelle shares that she likes to offer a 10% discount to customers who have done at least $500 worth of orders with her in the past. You ask how do customers know about this discount? What if you generated a report of all the customers with at least $500 of orders? You could then send letters out offering the discount in a marketing effort to generate more orders from your best customers. Danelle loves the idea!

Grabbing some coffee, your laptop, and putting on your headphones, it is time to code some Ruby.

- provide small data set
- provide large data set

RUBY PROGRAM TO IDENTIFY CUSTOMERS ELIGIBLE FOR THE DISCOUNT

# Reference other files

## The Typo

Danielle comes into the office confused and upset. She tells you that she just received a phone call from BUSINESS NAME. It has been a week since the scheduled shipping date and they have not received their order. Their marketing event is in a few days and they really need their T-Shirts. When you checked for the order, you can't find the order for BUSINESS NAME. You decide to search by the phone number. 

When you finally found the order, you also discoverd the problem:

<Business other order>
<Order info>

Oh crap! You mistyped the customer name! The customer address had a typo as well. You show Danielle and were able to work through the problem. Luckily the order was kept by their neighbor so they were able to get their T-Shirts in time for their marketing event.

But this exposed a problem with the current system. Recording the same customer's information over and over again for different orders just means there are lots of opportunities for mistakes. While looking through the orders you found a few other examples of issues:

1. Same phone number different business name
2. Same business name with different addresses
3. Same business name and address but different phone number

# The Customer Sheet

To solve this problem you create another spreadsheet. In this spreadsheet you only record the customer information: Customer Name, Address, Phone Number.

Now in your order sheet instead of recording customer information with the order, you need to make a reference to the customer sheet. Hmm... you could use the business name but what if the business changes their name? Same problem for phone number and address. What you need is a unique number for that customer that will never change. Something for your own record keeping. You decide to make a ID number column on the customer sheet. You then enter the customer ID number with an order.

# The Customer Lookup

When a new order come in, you need the ability to quickly look up a customer's id based on their name. You decide to create a Ruby program to handle the customer lookup given their business name.

<Ruby code>

Armed with your new Ruby Lookup program to look up the customer's ID, you start using your new system for managing order and customer data.

# The Customer Report V2

Danelle loves the new customer system and is glad this should make sure their information is consistent and up to date. She does miss her old customer report. Now since the customer information is on another sheet, the old program doesn't work. She asks if there is away to get it to work with the new system.

Read from the two files, link customers to orders by their id, create the same report.

<Ruby code>

Done. Genius. Good job! Now you can keep customer information in one sheet, orders in another sheet, and still correlate data for reports.

# Conclusion

Think about how we had to find an order. We had to load the entire record into memory and go through each record to find the exact one we wanted. In order to generate a report to sum all orders for a given shirt name, we had to go through each record to find the value to add. While this worked, as our database increases in size this operation would become slower and slower.

Welcome to computer databases in 1970s-1980s. Databases were often stored as flat files. Instead of comma separated values, values were often regulated to specific positions in the file. So the customer name was from column(5..11). Programming languages such as COBOL were developed that excelled in processing these files. Many business processes still work this way (particularly in finance and banking).

<Picture of COBOL>

To generate reports or find information, the entire file would be have to be processed. These files could be millions of lines long. Imagine trying process all the accounting transactions for Visa for a day, for a month or even for a year. Companies needed large mainframes to generate simple reports and those reports would take many hours to process.

<Picture of old server room>

This was the problem facing the world of computers. How can we make working with data better, faster, and easier? Computers keep getting faster and faster, but is there another way to speed up data processing? The answer was yes. The solution is known as Relational Databases. This is the type of database that we use in Rails and is what we will cover in the next section.


CSV - READ FROM CSV - BEST VALUABLE CUSTOMER - ORDERS BY SHIPPING ADDRESS - SHIRT NAME SOLD THE MOST - FIND AN ORDER


CUSTOMER MISTYPED ISSUE - BAD SHIPPING ISSUE - NORMALIZATION - CUSTOMER TABLE - SHEETS - RELATE BY IDS

REVISIT - MOST VALUABLE CUSTOMER - ORDERS BY SHIPPING ADDRESS
