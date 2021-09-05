# Ask for a list of TODOs 
# and print them back to us.

# puts "What is your next todo ?"
# next_todo = gets

# puts "\n\n\n" 
# puts "[ ] #{next_todo}"   # String Interpolation 

# Learning Ruby Variable Types
count=100
course="SaaS 201"
is_live=true
lessons=['Basics','Intermediate','Advanced']
puts "\n\n"
puts "This is "+course+" #{lessons[1]} course"

length=20
breadth=30
area = length*breadth
puts "The area of a rectangle with Length = #{length} and Breadth = #{breadth} is: #{area}"

# Learning BOOLEAN

puts "Fiction or non-fiction?"
genre = gets.chomp.downcase

if genre == "fiction"
  puts "Try reading Cryptonomicon by Neal Stephenson"
elsif genre == "non-fiction"
  puts "You should read The Ascent of Man by Jacob Bronowski!"
else
  puts "Oh I don't know about that genre"
end

