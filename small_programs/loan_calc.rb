principle = nil
duration = nil
interest_rate = nil

require 'yaml'
MSSG = YAML.load_file('loan_calculator_messages.yml')

def prmt(key)
  puts "=> #{MSSG[key]}"
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
  if integer?(principle) && principle != '0'
    break principle = principle.to_i
  elsif float?(principle) && principle != '0.0'
    break principle = principle.to_f
  elsif !integer?(principle) || !float?(principle)
    prmt('valid_num')
  end
end

loop do
  prmt('year')
  duration = gets.chomp
  if integer?(duration) && duration != '0'
    break duration = duration.to_i
  elsif float?(duration) && duration != '0.0'
    break duration = duration.to_f
  elsif !integer?(duration) || !float?(duration)
    prmt('valid_num')
  end
end

loop do
  prmt('rate')
  interest_rate = gets.chomp
  if integer?(interest_rate) && interest_rate != '0'
    break interest_rate = interest_rate.to_i
  elsif float?(interest_rate) && interest_rate != '0.0'
    break interest_rate = interest_rate.to_f
  elsif !integer?(interest_rate) || !float?(interest_rate)
    prmt('valid_num')
  end
end

monthly_rate = ((interest_rate.to_f / 100) / 12)
months = (duration.to_f * 12)
payment = principle.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(- months)))

puts "=> Given a starting principle of $#{principle} for a #{duration} year
   loan, at an interest rate of #{interest_rate}%, you would have
   #{months.round(2)} monthly payments of $#{payment.round(2)}"
