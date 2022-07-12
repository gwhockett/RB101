=begin
ex. 1 How old is Teddy?

puts "Who's birthday is it?"

birthday_person = gets.chomp

def years_age(it = 'Teddy')
  "#{it} is #{rand(20..200)} years old!"
end

if birthday_person == ''
  puts years_age
else
  puts years_age(birthday_person)
end

ex. 2 How big is the room?

def area_of_room(l, w)
  l * w
end

def area_of_room_feet(a)
  (a * 10.7639).round(3)
end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

area = area_of_room(length, width)
area_feet = area_of_room_feet(area)

puts "The area of the room is #{area} square meters (#{area_feet} square feet)."

ex. 3 Tip calculator

puts "How much is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
percent = gets.chomp.to_f

def tip_amount(b, p)
  b * (p/100)
end

tip = tip_amount(bill, percent).round(2)
tip_formatted = sprintf("%0.2f", tip)
total_formatted = sprintf("%.2f",bill + tip)

puts "The tip is $#{tip_formatted}"
puts "The total is $#{total_formatted}"
=end