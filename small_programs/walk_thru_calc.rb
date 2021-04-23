#ask for two numbers
#ask what kind of operation (+, - , * , /)
#print result to the screen
def prompt(message)
  puts "=> #{message}"
end
prompt "What is the first number?"

num1 = gets.chomp

prompt "What is the second number?"

num2 = gets.chomp

prompt "How would you like to put them together?"
prompt "Enter '+' for addition"
prompt "Enter '-' for subtraction"
prompt "Enter '*' for multiplication"
prompt "Enter '/' for division"

op = gets.chomp

if op == '+'
    prompt "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
  elsif op == '-'
    prompt "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
  elsif op == '*'
    prompt "#{num1} * #{num2} = #{num1.to_i * num2.to_i}"
  elsif op == '/'
    prompt "#{num1} / #{num2} = #{num1.to_f / num2.to_f}"
  else op != ('+' || '-' || '*' || '/')
    prompt "Not a recognized operation. Try again."
end