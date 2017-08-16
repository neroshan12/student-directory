# let's puts all students into an array
def input_students
  puts "Please enter the following information for the students (to finish, just hit return twice) "

  students = []                                   # create an empty array

  puts "First name?"
  name = gets.chomp

  while !name.empty? do                              # if name is not empty then execute the do block, if not jump to line 17
    puts "Cohort?"
    cohort = gets.chomp.to_sym

    if cohort.empty?
      cohort= :undecided
    end

    puts "Hobbies?"
    hobbies = gets.chomp

    puts "Height?"
    height = gets.chomp

    puts "Age"
    age = gets.chomp

    students << {name: name, hobbies: hobbies, height: height, age: age, cohort: cohort}      # add the student hash to the array
    puts "Now we have #{students.count} students"
    name = gets.chomp                                 # get another name from the user
  end
  students                                            # return the array of students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:hobbies]}, #{students[i][:height]}, #{students[i][:age]}, (#{students[i][:cohort]})".center(50) # => 1. (first student name) (first student cohort) and then will repeat while i is less than length of the array
  i += 1
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
