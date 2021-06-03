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

payment = nil

principle = nil

duration = nil
months = nil

interest_rate = nil
monthly_rate = nil

speak = nil

loop do
  puts "=> Please enter 'en' for english:"
  puts "=> Por favor 'es' para el español:"
  puts "=> Bitte geben Sie 'de' für Deutsch ein:"

  speak = gets.chomp.downcase

  break if speak == ('en')
  break if speak == ('es')
  break if speak == ('de')
end

SPOKEN = speak

require 'yaml'
MSSG = YAML.load_file('mortgage_calculator_messages.yml')

def language(message, lang)
  MSSG[lang][message]
end

def prmt(key)
  message = language(key, SPOKEN)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

prmt('welcome')

loop do
  prmt('amount')
  principle = gets.chomp
  x = principle
  if integer?(x) && x != '0'
    break x = x.to_i
  elsif float?(x) && x != '0.0'
    break x = x.to_f
  elsif !integer?(x) || !float?(x)
    prmt('valid_num')
  end
end

loop do
  prmt('year')
  duration = gets.chomp
  x = duration
  if integer?(x) && x != '0'
    break x = x.to_i
  elsif float?(x) && x != '0.0'
    break x = x.to_f
  elsif !integer?(x) || !float?(x)
    prmt('valid_num')
  end
end

loop do
  prmt('rate')
  interest_rate = gets.chomp
  x = interest_rate
  if integer?(x) && x != '0'
    break x = x.to_i
  elsif float?(x) && x != '0.0'
    break x = x.to_f
  elsif !integer?(x) || !float?(x)
    prmt('valid_num')
  end
end

monthly_rate = ((interest_rate.to_f / 100) / 12)
months = (duration.to_f * 12)
payment = principle.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(- months)))

puts "=> " + (MSSG[SPOKEN]['payments']) + " #{months.round(2)} " + (MSSG[SPOKEN]['monthly']) + "#{payment.round(2)}"
