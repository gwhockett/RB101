=begin
Question 1

In this hash of people and their age, see if "Spot" is present.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.member?('Lily')
p ages.key?("Spot")
p ages.include?("Lily")

Question 2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!

Question 3
Add #additional_ages to #ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

Question 4
See if the name "Dino" appears in the string below

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")

Question 5
Show an easier way to write this array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p %w(Fred Barney Wilma Betty BamBam Pebbles) == flintstones

Question 6
Add "Dino" to the array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones << "Dino"

Question 7

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones.push("Dino", "Hoppy")
p flintstones

Question 8
Shorten the sentence using the #slice! method.
Bonus: What happens when you use the non-destructive #slice method.
  #slice returns the parameter argument but the original string that #advice
  points to is unaffected. 

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!("Few things in life are as important as ")
p advice

Question 9
Write a one-liner to count the lower case "t"'s in the string

statement = "The Flintstones Rock!"
p statement.count('t')

Question 10
Back in the stone age (before CSS) we used spaces to aling things on the
screen. If we had a table of Flinstone family members that was forty
characters in width, how could we easily enter that title above the table with
spaces?

title = "Flintstone Family Members"
p title.center(40)
=end