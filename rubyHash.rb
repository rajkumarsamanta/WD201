library = {
  "rowling" => "Harry Potter",
  "lahiri" => "Interpreter of Maladies"
}

puts library["lahiri"] 

library = {}
library["austen"] = ["Pride and Prejudice", "Sense and Sensibility"]
library["asimov"] = ["Robots of Dawn", "I, Robot"]

authors = library.keys
puts "These are the authors in my catalog: #{authors.join(', ')}"

library.each do |author, books|
  puts "#{author.capitalize} wrote the books #{books.join(', ')}"
end

#WD201 level 2 hash problem 1
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
authorFirstnameSymbol=[]  
authors.each{|x|
  strName=x.split(" ")
  strFirst=strName[0].downcase
  firstnameSymbol = strFirst.to_sym
  authorFirstnameSymbol.push("#{firstnameSymbol}")
}
catalog={}
authorFirstnameSymbol.each_with_index{|k,i|
  sym = k.to_sym
  catalog[sym]=books[i]
}
puts"\n HASH Problem 1 OUTPUTS"
puts catalog
# fill in code that will create a Hash that looks like:
  #   {
  #     :bruno => "Design as Art",
  #     :neal => "Anathem",
  #     ...
  #   }

# Hash problem 2
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]
category=["money","organize","food"]
cat1=[]
cat2=[]
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

todoHash ={}
category.each_with_index{|str,i|
  sym=str.to_sym
  if i===0 then
    todoHash[sym]=cat1
  elsif i===1
    todoHash[sym]=cat2
  elsif i===2
    todoHash[sym]=cat3
  else
    puts "No Category !"
  end
}
puts "\n Hash Problrm 2 OUTPUTS"
puts todoHash