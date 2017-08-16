# let's puts all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []  # create an empty array

  name = gets.chomp   #get the first name

  while !name.empty? do       # if name is not empty then execute the do block, if not jump to line 17
    students << {name: name, cohort: :november}  # add the student hash to the array
    puts "Now we have #{students.count} students"
    name = gets.chomp   # get another name from the user
  end
  students    # return the array of students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
