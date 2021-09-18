require './connect_db.rb'
require './todo.rb'
connect_db!

puts "\nMy Todo-list \n\n"
puts "Overdue\n"
Todo.where("due_date < ?",Date.today).show_list

puts "\nDue Today\n"
Todo.where("due_date = ?",Date.today).show_list

puts "\nDue Later\n"
Todo.where("due_date > ?",Date.today).show_list