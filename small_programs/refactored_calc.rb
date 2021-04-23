# ask for two numbers
# ask what kind of operation (+, - , * , /)
# print result to the screen

num1 = nil
num2 = nil
op = nil
speak = nil

loop do
  puts "=> Please enter 'en' for english:"
  puts "=> Por favor 'es' para el español:"
  puts "=> Bitte geben Sie 'de' für Deutsch ein:"

  speak = gets.chomp.downcase

  break if speak == ('es')
  break if speak == ('en')
  break if speak == ('de')
end

SPOKEN = speak

require 'yaml'
MSSG = YAML.load_file('calculator_messages.yml')

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
  prmt('1st')
  num1 = gets.chomp
  if integer?(num1)
    break num1 = num1.to_i
  elsif float?(num1)
    break num1 = num1.to_f
  elsif !integer?(num1) || !float?(num1)
    prmt('valid_num')
  end
end

loop do
  prmt('2nd')
  num2 = gets.chomp
  if integer?(num2) && num2 != '0'
    break num2 = num2.to_i
  elsif float?(num2) && num2 != '0.0'
    break num2 = num2.to_f
  elsif !integer?(num2) || !float?(num2)
    prmt('valid_num')
  end
end

loop do
  MSSG[SPOKEN]['operation'].each do |n|
    puts "=> #{n}"
  end

  op = gets.chomp

  case op
  when '+'
    break puts "=> #{num1} + #{num2} = #{num1 + num2}"
  when '-'
    break puts "=> #{num1} - #{num2} = #{num1 - num2}"
  when '*'
    break puts "=> #{num1} * #{num2} = #{num1 * num2}"
  when '/'
    break puts "=> #{num1} / #{num2} = #{num1 / num2.to_f}"
  end
  if op != ('+' || '-' || '*' || '/')
    prmt('valid_op')
  end
end
