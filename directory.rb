def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  counter = students.length
  students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  # Empty array for storage of names
  students = []
  puts "Please enter the names of the first student"
  puts "To finish, just hit return once"
  
  while true do
    # Gets the first name
    name = gets.chomp
    # While the name is not empty repeat code
    if !name.empty? 
      # Gets Hobby
      puts "Please enter your favourite hobby"
      hobby = gets.chomp
      # Gets country of birth
      puts "Please enter your country of birth"
      country = gets.chomp
      # Add the student hash to the array
      students << {name: name, cohort: :november, hobby: hobby, country: :country}
      puts "Now we have #{students.count} students"
      puts "Please enter the name of the next student or enter to stop"
    elsif name.empty?
      break
    end
  end
  # Returns array of students
  students
end

# Asks for user for starting character they want to filter for
def name_by_letter(students)
  puts "Select the first letter you want to match with"
  selected_students = []
  letter = gets.chomp
  selected_students << students.select {|student| student[:name].start_with?(letter)}
  puts selected_students
end

# Filters out names on character length
def name_length(students)
  students.each do |student|
    if student[:name].length < 12
      puts student
    else
    end
  end
end

students = input_students
print_header
print(students)
print_footer(students)
# name_by_letter(students)
# name_length(students)