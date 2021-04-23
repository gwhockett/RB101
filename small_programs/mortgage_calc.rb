=begin
create a mortgage / loan calculator

ask user to declare the following
- initial loan amount
- APR (annual interest rate)
- length of time for the loan

after obtaining the above calculate and output
- the monthly interest rate
- how many months it will take to pay the loan
- monthly payment

use the following formula for calculation

m = p * (j / (1- (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

=end

=begin

START

PRINT "What is the original amount of your loan?"
GET and SET to loan_amount

WHILE 

PRINT "What is the APR? (annual percentage rate)"
PRINT "Please enter a number between 0 and 100"
GET and SET to year_rate

PRINT "How many years will this loan last?"
GET and SET to length

=end


def integer?(input)
  input.to_i.to_s == input
end

def integer_1?(input)
  /^-?\d+$/.match(input)
end

def integer_2?(input)
  Integer(input) rescue false
end

def float?(input)
  input.to_f.to_s == input
end

def float_1?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def float_2?(input)
  Float(input) rescue false
end

num1 = gets.chomp
puts ">>Integer"
p integer?(num1)
p integer_1?(num1)
p integer_2?(num1)
puts ">>Float"
p float?(num1)
p float_1?(num1)
p float_2?(num1)