def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Empty array for storage of names
  students = []
  # Gets the first name
  name = gets.chomp
  # While the name is not empty repeat code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Gets another name in loop
    name = gets.chomp
  end

students
# Returns array of students
end

# Asks for user for starting character they want to filter for
def name_by_letter(students)
  puts "Select the first letter you want to match with"
  selected_students = []
  letter = gets.chomp
  selected_students << students.select {|student| student[:name].start_with?(letter)}
  puts selected_students
end

students = input_students
print_header
print(students)
print_footer(students)
name_by_letter(students)