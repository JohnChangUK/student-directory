#In this exercise, we are prnting names that are shorter than 12 characters
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #Create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #While the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "----------------"
end

def print(students)
  students.each_with_index do |student|
    if student[:name].length < 12
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#We still need to call the methods to invoke it

students = input_students
print_header
print(students)
print_footer(students)
