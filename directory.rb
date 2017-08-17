# let's puts all students into an array
def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"  # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
      end
    end
end



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

interactive_menu()
