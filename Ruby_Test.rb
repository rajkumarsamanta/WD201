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

#Learn Array
my_nums=[1,2,3,4,5,6,7]
my_nums.each{|x| puts "Current number is: #{x}"}
new_nums=my_nums.map{|x| x**2}
new_nums.each{|n| puts n}

# Problem 1: nested array of names
names=[["Raj Kumar","Samanta"],["Vivek", "Sood"],["P. K.","Sethy"],["Hirok","Dutta"]]
#full_names=names.map{|x| x[0]+ " " +x [1]}
full_names=names.map{|x| x.join(" ")}
full_names.each{|n| puts n}

#Problem 2 merging two arrays
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
books_authors = books.map.with_index {|book, i| "#{book} is written by #{authors[i]}"}
books_authors.each{|x| puts x}

#Learn todo list by category problem 3

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]

catArr=[]
moneyCat =["money"]
cat1=[]
orgCat=["organize"]
cat2=[]
foodCat=["food"]
cat3=[]
todos.each{ |x|
  if (x[1]=="money") then 
    cat1.push("#{x[0]}")
  elsif (x[1]=="organize") then 
    cat2.push("#{x[0]}")
  else
    cat3.push("#{x[0]}")
  end
}
moneyCat.push(cat1)
orgCat.push(cat2)
foodCat.push(cat3)
catArr.push(moneyCat,orgCat,foodCat)

catArr.each{|k|
  puts "\n#{k[0]} :\n"
  k[1].each{|y|
    puts "  #{y}"
  }
}
