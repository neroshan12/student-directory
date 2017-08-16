# let's puts all students into an array
def input_students
  puts "Please enter the following information for the students (to finish, just hit return twice) "

  students = []                                   # create an empty array

  puts "First name?"
  name = gets.delete("\n")

  while !name.empty? do                              # if name is not empty then execute the do block, if not jump to line 17
    puts "Cohort?"
    cohort = gets.delete("\n").to_sym

    if cohort.empty?
      cohort= :undecided
    end

    puts "Hobbies?"
    hobbies = gets.delete("\n")

    puts "Height?"
    height = gets.delete("\n")

    puts "Age"
    age = gets.delete("\n")

    students << {name: name, hobbies: hobbies, height: height, age: age, cohort: cohort}      # add the student hash to the array
    puts "Now we have #{students.count} students"
    name = gets.delete("\n")                                 # get another name from the user
  end
  students                                                    # return the array of students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  if !students.empty?
        students.sort_by! {|student| student[:cohort]}
        students.each_with_index do |student, i|
      puts ("#{i + 1}. #{students[i][:name]}, #{students[i][:cohort]}, #{students[i][:hobbies]}, #{students[i][:height]}, #{students[i][:age]}" ).center(50)
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have a great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
