Introduction to CSVs and File Databases
======

# A bit about the audience

In general, the audience will have had little to no programming experience before starting the curriculum. They will have already been taught the basics of Ruby style programming, looping, and how blocks are used. The audience will also have become comfortable with defining classes, methods, and instantiating instances of those classes.

# Introduction to CSVs

The original computers couldn't store any data. These monolithic monsters the size of rooms could only provide immediate computation based on the data passed. Rooms of machines with the capabilities of simple handheld calculators. 

There quickly became a need to be able to store data for a computer to process at a later date. At first this was done through the use of punch cards (think Scantrons). As the data being collected grew, this method became unwieldy. Who wants to keep track of boxes of cards?

Necessity is the mother of invention, so computers soon had tape and hard drives allowing them to write data down into digital files. Programs could then access these files, do computations, and generate reports.

Let's explore how that worked and how we can use Ruby to process files to help run a business.

## The Problem

Your friend Danielle recently decided to chase her dream and open her own t-shirt printing business. No surprise to her friends and family, the business has caught on and is becoming a big success.

Business is so good, Danielle asked you to come help her keep track of her orders, so she can focus on making awesome t-shirts.

## The Spreadsheet Solution

Her previous record keeping was on a sheet of paper (and sometimes scraps of paper) around her office desk. When people called to place an order, Danielle would record: Customer Name, Phone Number, Shirt Name, and Order Amount.

First thing you decide is that this analog paper recording keeping has got to go. Instead of writing orders down on paper, you decide to use a spreadsheet on your laptop.

Across the top, you write the type of information you will record for each order. Each of these are the columns in your spreadsheet.

```
╔═══════════════╦══════════════╦════════════╦══════════════╗
║ Customer Name ║ Phone Number ║ Shirt Name ║ Order Amount ║
╚═══════════════╩══════════════╩════════════╩══════════════╝
```

Then, as you answer the phone to receive orders or Danielle hands you notes from sales she has made, you enter the information into the spreadsheet. Each order you write is a row in your spreadsheet.

```
╔═══════════════╦════════════════╦════════════╦══════════════╗
║ Customer Name ║  Phone Number  ║ Shirt Name ║ Order Amount ║
╠═══════════════╬════════════════╬════════════╬══════════════╣
║ Andy Lakin    ║ (565) 521-2561 ║ Star Wars  ║          201 ║
╚═══════════════╩════════════════╩════════════╩══════════════╝
```

This system works great! Danielle is happy because she has less paperwork, and the desk is now clear of paper. You also have a clear record of all the orders for Danielle so she knows what shirts to make.

## Hello CSVs

Months go by, and everything runs like clockwork. Orders come in. T-shirts ship out. Business is booming.

One Friday afternoon after the last order was shipped, Danielle and you were sitting back drinking some beer and chatting about how great things have been. Danielle was feeling thankful for the success of her business and decided to reward the customer with the largest order with a discount on a future order.

That weekend you decided that since you have been learning Ruby, maybe you can use that new skill to find the largest order for her.

While Ruby can read spreadsheets, like many other programming languages, it is easier to read files in a CSV format.

CSV stands for Comma Separate Values. A CSV file has data stored in rows whose columns are separated by commas.

A spreadsheet like this:

```
╔═══════════════╦════════════════╦════════════╦══════════════╗
║ Customer Name ║  Phone Number  ║ Shirt Name ║ Order Amount ║
╠═══════════════╬════════════════╬════════════╬══════════════╣
║ Andy Lakin    ║ (565) 521-2561 ║ Star Wars  ║          201 ║
╚═══════════════╩════════════════╩════════════╩══════════════╝
```

Exports to a CSV file that looks like this:

```
Andy Lakin,(565) 521-2561,Star Wars,201
```

As you would expect, each of the values is separated by commas. Would be weird if that wasn't true, right? Because CSVs are so simple, they are commonly used as a way to pass data between different computer programs.

## Finding the Largest Order

In a new directory, create a file and call it `find_largest_order.rb`. Next create a csv file and call it `orders.csv`. In the CSV file, copy the data here:

```
Kristopher Prosacco DDS,(687) 165-7038,Prince,487
Andy Lakin,(565) 521-2561,Star Wars,201
Ruben Okuneva,(137) 848-3643,Prince,53
Mr. Haleigh Wyman,(797) 395-1377,Harry Potter,128
Agustina Jones,(420) 714-2963,Harry Potter,306
Jany Homenick,(226) 465-2766,Prince,33
Alberto Hettinger,(201) 411-5557,Cowboys,338
Tyrese Kessler,(331) 863-6574,Star Wars,475
Fredy Ryan,(447) 213-3911,Harry Potter,45
Kiel Herman,(322) 343-4457,Cowboys,346
```

Your project's folder directory should now look like:

```
/
  find_largest_order.rb
  orders.csv
```

### The Algorithm

Its a good idea to think about what the program should do before you write any code. Here is what the program needs to do.

```
* Read the CSV file
* Read each order line by line
* Look at each order to see if it is the largest order
  * If it is the largest order, then save the order
* Print the largest order
```

Since you now know what the program should do it is time to write your Ruby program.

### Step 1: Read the CSV File

To read the CSV file, you need to first open the file. 

```
# Read the CSV file
file = File.open("orders.csv")
```

Then you need to read the contents of the file and place it in a variable you can work with. You can call this variable anything, but naming it `text` communicates its purpose to future developers. That future developer could be you! Weeks or months from now, you might not remember what you were thinking when writing this program so having a program that is easy to read and understand helps. Ruby helps with this because it is so easy to read.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read
```

If you output the value of `text` to the console. 

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read
puts text
```

We should see the contents of the `text` variable. It should look like the following.

```
"Kristopher Prosacco DDS,(687) 165-7038,Prince,487\nAndy Lakin,(565) 521-2561,Star Wars,201\nRuben Okuneva,(137) 848-3643,Prince,53\nMr. Haleigh Wyman,(797) 395-1377,Harry Potter,128\n ....
```

Notice the values are separated by commas (remember CSV stands for Comma Separated Values). The other important part of this file might be hard to see at first. Look through the output for `\n`s. 

Computers deal with compact streams of data meaning they don't care about whitespace or readability. Remember computer's used to read data from large tapes. That is a good metaphor to use when thinking about how a computer reads data. You can also think of it as a stream. In fact the term `stream` is used in many languages to refer to reading a file.

If you have a stream of characters, how would you know what is a space versus when to display the data on a new line? For computers, they made up a new character, `\n`, that tells the computer to go to a new line.

So, if you had a file that contained:

```
What the hell
is a new line
character
```

It would be read in as:

```
What the hell\nis a new line\ncharacter
```

### Step 2: Read each order line by line

The `\n` new line character is what allows us to be able to read the file line by line. Doing this operation is so common, Ruby has a helper method (`#each_line`) on string to simplify the process.

```
# Read the csv file and place the contents into text
file = File.open("orders.csv")
text = file.read

# read each order line by line
text.each_line do |line|
  puts line
end
```

Each order should come back as a line in the file.

```
Andy Lakin,(565) 521-2561,Star Wars,201
```

Right now, this line is just a large string. This means there is no easy way for you to access the different parts of the order.

#### Split that string

You need to be able to access the different parts of the order independently. In order to do this, you can use the `#split` method.

Split works by converting a string into an array of values by splitting the values using the passed in paramter. This means that you can split a string on things other than commas.

```
$ irb
> "Split,is,neat".split(",")
=> ["Split", "is", "neat"]
> "WorksRUBYwithRUBYwithoutRUBYcommas".split("RUBY")
=> ["Works", "with", "without", "commas"] 
```

Back in your `find_largest_order.rb` program, you can use `split` to turn the string in `line` into an array of values that you store in `order`. 

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

When you run your Ruby program now, you should see the orders in the console as arrays of values.

```
["Andy Lakin", "(565) 521-2561", "Star Wars", "201\n"]
...
```

Oh look, Mr. `\n` is there in your data! You don't want that added to the end of every order amount. Let's remove the `\n` from your data.

#### Gsub out `\n`

We can remove characters from a string using `gsub`. `Gsub` is a method on string that lets you replace any matching string value with another one. 

```
> "Hello World".gsub("Hello", "Hi")
=> "Hi World"
```

For your scenario, that means you can replace `\n` with nothing `""`.

```
> "Get rid of that new line \ninterloper\n".gsub("\n", "")
=> "Get rid of that new line interloper" 
```

Back in your `find_largest_order.rb` program, you can replace the `\n` in your order using `gsub` before you use `split`.

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

Now your orders should look like:

```
["Andy Lakin", "(565) 521-2561", "Star Wars", "201"]
...
```

### Step 3: Look at each order to see if it is the largest order

Let's review our algorithm:

```
* Read the CSV file - DONE
* Read each order line by line - DONE
* Look at each order to see if it is the largest order
  * If it is the largest order, then save the order
* Print the largest order
```

Making progress! Now you need to find the order amount for each order. The order array always has the values in the same order. Recall that the columns in our spreadsheet were: Customer Name, Phone Number, Shirt Name, and Order Amount. Since arrays in Ruby start at index 0, you can identify where each column's data is in each row by writing down the index and the column name it corresponds to.

```
# customer name - 0
# phone number - 1
# shirt name - 2
# order amount - 3
order_amount = order[3]
```

Now update your program to print all the order amounts.

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
  # shirt name - 2
  # order amount - 3
  customer_name = order[0]
  order_amount = order[3]
  puts "#{customer_name} - #{order_amount}"
end
```

When you run the program, you should see the orders with the customer name and order amount.

```
Kristopher Prosacco DDS - 487
Andy Lakin - 201
Ruben Okuneva - 53
Mr. Haleigh Wyman - 128
Agustina Jones - 306
Jany Homenick - 33
Alberto Hettinger - 338
Tyrese Kessler - 475
Fredy Ryan - 45
Kiel Herman - 346
```

You now have access to each order and can read the order amount. The next task is to add logic to identify the order with the largest amount.

First you need a variable to keep track of the largest order. You also need a variable to keep track of the largest order amount. Start the largest order amount at 0.

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

Now lets think how we want the logic to work:

```
* For every order, you need to check if the order amount is greater than the current largest order amount
* If this order amount is greater that the current largest order amount
  * Make this order the new largest order
  * Make the largest order amount this new largest order amount
```

```
...
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
  order_amount = order[3]

  # If this order amount is greater that the current largest order amount
  if order_amount > largest_order_amount
    # Make this order the new largest order
    largest_order = order
    # Make the largest order amount this new largest order amount
    largest_order_amount = order_amount
  end
end
```

Lets see if that works. Run your Ruby program.

Oh no! You should have gotten an error.

```
`>': comparison of String with 0 failed (ArgumentError)
```

What is happening is the order amount you read from the file isn't a number. It is actually a string. `234` is not the same thing in Ruby as `"234"`. So when you try to compare `"401"` to `0` using `>`, Ruby can't do it so it throws an error. 

What you need to do is convert `"401"` to `401`. You can convert a string to an integer using the `to_i` method.

```
$ irb
> "401".to_i
401
```

Let's update your code to convert the order amount.

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
  # shirt name - 2
  # order amount - 3
  order_amount = order[3].to_i

  if order_amount > largest_order_amount
    largest_order = order
    largest_order_amount = order_amount
  end
end
```

### Step 4: Print the Largest Order

Almost done. Let's review the algorithm:

```
* Read the CSV file - DONE
* Read each order line by line - DONE
* Look at each order to see if it is the largest order - DONE
  * If it is the largest order, then save the order - DONE
* Print the largest order
```

All you need to do now is print the results of your program.
```
# read each order line by line
text.each_line do |line|
  ...
end

# print the results
puts "The Largest Order is from #{largest_order[0]}"
puts "The Largest Order amount is #{largest_order[5]}"
```

### Done

Putting it altogether, your program should now look like:

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
```

Now run your Ruby program and see the results.

```
$ ruby find_largest_order.rb 
The Largest Order is from Kristopher Prosacco DDS
The Largest Order amount is 487
```

Woot! It works! Please enjoy your Dr. Frankenstein moment. Let your inner mad scientist out for a bit. ITS ALIVE! MWHAHAHA!

### The Story Continues

On Monday you shared your Ruby program with Danielle and shared the customer information for the largest order. She is ecstatic! The success of your Ruby program to process the orders sparks tons of ideas and you both brainstorm on other future uses.

### Challenge: The Order Lookup

You both wonder outloud if you could use another Ruby program to be able to look up an order based on a phone number.

HINT 1: Just like `puts` outputs to the console, you can receive input from the console using `gets`.

```
puts "Whats your name?"
name = gets
```

HINT 2: Instead of using `gsub` to remove the new line character (`\n`), you can use `chomp` to do the exact same thing.

# Conclusion

Think about how you had to find an order. We had to load the entire record into memory and go through each record to find the exact one we wanted. In order to generate a report to sum all orders for a given shirt name, we had to go through each record to find the value to add. While this worked, as our file increased in size this operation would become slower and slower.

Welcome to computer databases in 1970s-1980s. Databases were often stored as flat files. Instead of comma separated values, values were often regulated to specific positions in the file. So the customer name was from column(5..11). Programming languages such as COBOL were developed that excelled in processing these files. Many business processes still work this way (particularly in finance and banking).

To generate reports or find information, the entire file would be have to be processed. These files could be millions of lines long. Imagine trying process all the accounting transactions for Visa for a day, for a month or even for a year. Companies needed large mainframes to generate simple reports and those reports would take many hours to process.

This was the problem facing the world of computers. How can we make working with data better, faster, and easier? Computers keep getting faster and faster, but is there another way to speed up data processing? The answer was yes. The solution is known as Relational Databases. This is the type of database that we use in Rails and is what we will cover in the next section.