@students = [] # an empty array accessible to all methods

def print_menu
  puts "Please choose from the following menu: "
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def push_to_students(name, hobbies, height, age, cohort)
  @students << {name: name, hobbies: hobbies, height: height, age: age, cohort: cohort}
end

def input_students
  puts "Please enter the following information for the students (to finish, just hit return twice) "
  puts "First name?"
  name = STDIN.gets.chomp

  while !name.empty? do                              # if name is not empty then execute the do block, if not jump to line 17
    puts "Cohort?"
    cohort = STDIN.gets.chomp.to_sym

    if cohort.empty?
      cohort= :undecided
    end

    puts "Hobbies?"
    hobbies = STDIN.gets.chomp

    puts "Height?"
    height = STDIN.gets.chomp

    puts "Age"
    age = STDIN.gets.chomp

    push_to_students(name, hobbies, height, age, cohort)
          # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp                               # get another name from the user
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
        @students.each_with_index do |student, i|
      puts ("#{i + 1}. #{@students[i][:name]}, #{@students[i][:cohort]}, #{@students[i][:hobbies]}, #{@students[i][:height]}, #{@students[i][:age]}" ).center(50)
    end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have a great student".center(50)
  else
    puts "Overall, we have #{@students.count} great students".center(50)
  end
end

def save_students
  file = File.open("students.csv", "w")     # Open the file for writing, When we open a file, the open() method returns us a reference to the file that we can save it a variable called "file"
  @students.each do |student|               # Then we iterate over the array of students, processing one student at a time.
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:height], student[:age]]   # Array created
    csv_line = student_data.join(", ")       # Joins all elements of the array together
    file.puts csv_line                      # Writes to the csv file not screen
  end
  file.close                                # Everytime you open a file, it needs to be closed
end

def load_students(filename = "students.csv")  # will load filename, and if no value is given the default will be loaded (students.csv)
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobbies, height, age = line.chomp.split(',')    # Variable assignment
    push_to_students(name, hobbies, height, age, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first       # first argument from the command line
  if filename.nil?     # get out of the method if it isn't given
    load_students
  elsif File.exists?(filename)   # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else                        # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit                      # quit the program
  end
end

try_load_students
interactive_menu
