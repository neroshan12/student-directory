# let's puts all students into an array
def input_students
  puts "Please enter the following information for the students (to finish, just hit return twice) "

  students = []                                   # create an empty array

  puts "First name?"
  name = gets.chomp

  puts "Hobbies?"
  hobbies = gets.chomp

  puts "Height?"
  height = gets.chomp

  puts "Age"
  age = gets.chomp

  while !name.empty? do                              # if name is not empty then execute the do block, if not jump to line 17
    students << {name: name, hobbies: hobbies, height: height, age: age, cohort: :november}      # add the student hash to the array
    puts "Now we have #{students.count} students"
    name = gets.chomp                                 # get another name from the user
  end
  students                                            # return the array of students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:hobbies]}, #{students[i][:height]}, #{students[i][:age]}, (#{students[i][:cohort]} cohort)" # => 1. (first student name) (first student cohort) and then will repeat while i is less than length of the array
  i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
