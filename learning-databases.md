Introduction to CSVs and File Databases
======

# Introduction

The original computer programs couldn't store any data. They could only provide immediate computation based on the data passed in much like simple calculators. There quickly became a need to be able to store data for a computer to process at a later date. The first method to solve this problem was to write data down in computer files. Programs could then access the files, do computations, process transtions, and generate reports.

Lets explore how that worked and how we can use Ruby to process files to help run a business.

# Introduction to CSVs

## The Problem

Your friend Danielle recently decided to chase her dream and open her own T-Shirt printing business. No surprise to her friends and family, the business has caught on and is becoming a big success.

Business is so good, Danelle asked you to come help her keep track of her orders so she can focus on making awesome T-Shirts.

## The Spreadsheet Solution

Her previous record keeping was on a sheet of paper (and sometimes scraps of paper) around the office desk. When people called to place an order, Danelle would record: Customer Name, Phone Number, Shipping Address, Shirt Name, Shirt Size, Order Amount, Order Date, Shipping Date. When an order shipped, she would put a check next to the order line.

First thing you decide is that this analog paper recording keeping has to go. Instead of writing orders down on paper, you use a spreadsheet on your computer.

So across the top you write the type of information you will record for each order. Each of these are the columns in your spreadsheet.

<Picture of Spreadsheet with columns>

Then as you answer the phone to receive orders or Danielle hands you notes from sales she made, you enter the information into the spreadsheet. Each order you write is a row in your spreadsheet.

<Picture of Spreadsheet with some rows>

When an order ships, you go back to your spreadsheet and enter 'Yes' at the end of the row under a column you made called Shipped.

This system works great! Danelle is happy because she has less paperwork and the desk is now clear of paper. 

## Hello CSVs

Months go by and everything runs like clockwork. Orders come in. T-Shirts ship out. Business is booming.

One Friday afternoon after the last order was shipped, Danielle and you were sitting back drinking some beer and chatting about how great things have been. Danielle was feeling thankful for the business and wanted to give back to her customers. She wanted write a thank you to the customer with the largest order.

You wanted to suprise Danelle and have that information for her on Monday. That weekend you decided that since you have been learning Ruby, maybe you can use Ruby to get her that information.

While Ruby can read spreadsheets, like many other programming languages it is easier for Ruby to read CSVs.

CSV stands for Comma Separate Values. A CSV file has data stored in rows whose columns are separated by commas.

A spreadsheet like this:

<Picture of Spreadsheet>

Exports to a CSV file that looks like this:

<Picture of CSV file>

## The Largest Order

Before you process the large file of orders to find the largest order, you wanted to make sure your program works. In a separate spreadshet you copy 10 orders down. Reviewing the orders you can easiliy see that the Boy Who Lived Fan Club order is the largest.

Now time to write your ruby program.

RUBY PROGRAM TO FIND LARGEST ORDER

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
