require "date"

class Todo
  def initialize(work_text,due_date,done)
    @work_text = work_text
    @due_date = due_date
    @done = done
  end

  def work_text
    @work_text
  end

  def due_date
    @due_date
  end

  def done
    @done
  end

  def overdue?
    Date.today > @due_date
  end

  def due_today?
    Date.today == @due_date
  end

  def due_later?
    @due_date > Date.today
  end

  def to_displayable_string
    "[ ] #{@work_text} #{@due_date} completed: #{@done}"
  end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end

  def add(new_toto)
    @todos.push(new_toto)
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end

  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_today? })
  end 

  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_later? })
  end 

  def to_displayable_list
    @todos.map{|obj| 
      if obj.due_today?
        if obj.done
          check ="X"
        else
          check =" "
        end
        "[#{check}] #{obj.work_text}"
      else
        "[ ] #{obj.work_text} #{obj.due_date}"
      end
    }.join("\n")
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

 todos_list = TodosList.new(todos)

 todos_list.add(Todo.new("Service vehicle", date, false))
 
 puts "My Todo-list\n\n"

 puts "Overdue\n"
 puts todos_list.overdue.to_displayable_list
 puts "\n\n"

 puts "Due Today\n"
 puts todos_list.due_today.to_displayable_list
 puts "\n\n"

 puts "Due Later\n"
 puts todos_list.due_later.to_displayable_list
 puts "\n\n"