class Student
   def initialize(roll_no, name)
        @roll_no = roll_no
        @name = name
    end

   def enroll
       @is_enrolled = true
   end

   def is_enrolled
       @is_enrolled
   end

   def name
       @name
   end

   def roll_no
       @roll_no
   end
end

class Course
    def initialize(name, students)
        @name = name
        @students = students
    end

    def get_student(roll_no)
        @students.find {|student| student.roll_no == roll_no}
    end

    def is_student_enrolled?(roll_no)
        @students.any?{|student| student.roll_no == roll_no} 
    end

    def enroll(newStudent)
        @students.push(newStudent)
    end

    def name
        @name
    end
end

class Department
    def initialize(name, classroomCount)
        @name = name
        @classroomCount = classroomCount
        @teachers =[]
    end

    def addTeacher(teacher)
        @teachers.push(teacher)
    end

    def classroomInfo
        "Classroom Count: #{@classroomCount}"
    end
    
    def teachersInfo
        "Number of Teachers: #{@teachers.length}"
    end

    def departmentInfo
        "Department: #{@name}, #{classroomInfo} #{teachersInfo}"
    end
end

class ComputerDepartment < Department
    def initialize(name,classroomCount, labCount, confCount)
       super(name, classroomCount)
       @labCount = labCount
       @confCount = confCount 
    end

    def classroomInfo
        "Rooms count - Classrooms: #{@classroomCount}, Labs Count: #{@labCount}, Conference Rooms: #{@confCount}"
    end
end

saas = Course.new("Saas 201",[Student.new(102,"Raj"), Student.new(88,"Vivek")])
saas.enroll(Student.new(75,"Bidesh"))
puts saas.name
puts saas.get_student(88).name

dept = ComputerDepartment.new("CSE",6,7,3)
dept.addTeacher("Dr. Raj Kumar Samanta")
dept.addTeacher("Dr. Hiranmay")
puts "\n"
puts dept.departmentInfo
puts dept.classroomInfo