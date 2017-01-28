#Adding more information, such as hobbies, country of birth and height.
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #Create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #While the name is not empty, repeat this code
  puts "What are your hobbies Sir/Madam?"
  hobbies = gets.chomp
  puts "Just curious... which country were you born in?"
  country_of_birth = gets.chomp
  puts "Last question... How tall are you? in cm please!"
  height = gets.chomp
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, country_of_birth: country_of_birth,
    height: height}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Anymore students? If so please enter! If not, press return twice to exit!"
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
  students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort, My hobbies are #{student[:hobbies]}, My country of birth is #{student[:country_of_birth]}
    and my height is #{student[:height]})"
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
