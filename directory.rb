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

students = input_students