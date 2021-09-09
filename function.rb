def salute(name,quote)
  nameWords=name.split(" ")
  quote + " Mr. " + nameWords.last
end 

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")