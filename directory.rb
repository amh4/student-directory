require 'csv'
@students = [] # Empty array accessible to all methods

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  cohort_groups = {}
  @students.each_with_index do |student, index|
    cohort = student[:cohort]
    if cohort_groups[cohort] == nil
      cohort_groups[cohort] = []
    end
    cohort_groups[cohort].push(student[:name], student[:hobby], student[:country])
  end
  puts cohort_groups
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  # Empty array for storage of names
  default_cohort = :november
  default_name = "John Doe"

  puts "Please enter the names of the first student"
  puts "To finish, type in stop once you have finished all student's details"
  
  while true do
    # Gets the first name
    name = STDIN.gets.chomp.downcase
    # If they have not entered a name, they want to break. Else then ask for the cohort and continue
    if name == "stop"
      break
    # Check for Empty name and need for DEFAULT NAME
    elsif name.empty?
      puts "Please enter their cohort"
      cohort = STDIN.gets.chomp
      # While the name is not empty repeat code
      if cohort.empty?
        # Gets Hobby
        puts "Please enter your favourite hobby"
        hobby = STDIN.gets.chomp
        # Gets country of birth
        puts "Please enter your country of birth"
        country = STDIN.gets.chomp
        # Add the student hash to the array
        @students << {name: default_name, cohort: default_cohort, hobby: hobby, country: :country}
        if @students.count < 2
          puts "Now we have #{@students.count} student"
        else
          puts "Now we have #{@students.count} students"
        end
        puts "Please enter the name of the next student or type stop"
      elsif !cohort.empty?
        # Gets Hobby
        puts "Please enter your favourite hobby"
        hobby = STDIN.gets.chomp
        # Gets country of birth
        puts "Please enter your country of birth"
        country = STDIN.gets.chomp
        # Add the student hash to the array
        @students << {name: default_name, cohort: cohort.to_sym, hobby: hobby, country: :country}
        if @students.count < 2
          puts "Now we have #{@students.count} student"
        else
          puts "Now we have #{@students.count} students"
        end
        puts "Please enter the name of the next student or type stop"
      end
    # Check name has been entered
    elsif !name.empty?
      puts "Please enter their cohort"
      cohort = STDIN.gets.chomp
      # While the name is not empty repeat code
      if cohort.empty?
        # Gets Hobby
        puts "Please enter your favourite hobby"
        hobby = STDIN.gets.chomp
        # Gets country of birth
        puts "Please enter your country of birth"
        country = STDIN.gets.chomp
        # Add the student hash to the array
        @students << {name: name, cohort: default_cohort, hobby: hobby, country: :country}
        if @students.count < 2
          puts "Now we have #{@students.count} student"
        else
          puts "Now we have #{@students.count} students"
        end
        puts "Please enter the name of the next student or type stop"
      elsif !cohort.empty?
        # Gets Hobby
        puts "Please enter your favourite hobby"
        hobby = STDIN.gets.chomp
        # Gets country of birth
        puts "Please enter your country of birth"
        country = STDIN.gets.chomp
        # Add the student hash to the array
        @students << {name: name, cohort: cohort.to_sym, hobby: hobby, country: :country}
        if @students.count < 2
          puts "Now we have #{@students.count} student"
        else
          puts "Now we have #{@students.count} students"
        end
        puts "Please enter the name of the next student or type stop"
      end
    end
  end
  # Returns array of students
  @students
end

# Asks for user for starting character they want to filter for
def name_by_letter
  puts "Select the first letter you want to match with"
  selected_students = []
  letter = STDIN.gets.chomp
  selected_students << @students.select {|student| student[:name].start_with?(letter)}
  puts selected_students
end

# Filters out names on character length
def name_length
  @students.each do |student|
    if student[:name].length < 12
      puts student
    else
    end
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_menu
  puts "1. Input Students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    puts "Option 1 selected"
    input_students
  when "2"
    puts "Option 2 selected"
    show_students
  when "3"
    puts "Option 3 selected"
    save_students
  when "4"
    puts "Option 4 selected"
    load_students
  when "9"
    puts "Option 9 selected"
    exit 
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # Asks user to provide file name
  puts "What would you like to name the file? .csv will be added automatically for you"
  user_file_name = STDIN.gets.chomp
  CSV.open("#{user_file_name}.csv", "a+") do |row|
  # Iterate over the array of students
    @students.each do |student|
      row << [student[:name], student[:cohort]]
    end
  end
end

# Ask if they want a specific file
# If not load default value

def load_students(filename = "students.csv")
  puts "Do you want to enter a file name? Y/N"
  user_answer = gets.chomp
  if user_answer == "Y"
    puts "Enter a file to load"
    filename = gets.chomp
    CSV.foreach(filename) do |student|
      name, cohort = student
      @students << {name: name, cohort: cohort.to_sym}
    end
  elsif user_answer == "N"
    CSV.foreach(filename) do |student|
      name, cohort = student
      @students << {name: name, cohort: cohort.to_sym}
    end
  else
    puts "Invalid choice"
  end
end 

def try_load_students
  # first argument from the command line
  filename = ARGV.first
  # get out of the method if it isn't given
  return if filename.nil? # get out of the method if it isn't given
  # if it exists
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

interactive_menu
