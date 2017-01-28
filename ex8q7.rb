#Adding more information, such as hobbies, country of birth and height.
def input_students
  puts "Please enter the names of the students"

  #get the first name
  name = gets.chomp
  #Get the value of the cohort
  puts "Which cohort is this student in?"
  cohort = gets.chomp
  #Create an empty array, to store our values in
  students = []
  puts "To finish, just hit return twice"
  #While the name is not empty, repeat this code
  puts "What are your hobbies Sir/Madam?"
  hobbies = gets.chomp
  puts "Just curious... which country were you born in?"
  country_of_birth = gets.chomp
  puts "Last question... How tall are you? in cm please!"
  height = gets.chomp
  #While the name is not empty, repeat this code
  while !name.empty? do
    cohort = checking_cohort(cohort) #Default value will be November
    #add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth,
    height: height}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "What is the other student's name?"
    name = gets.chomp
    break if name.empty?
    puts "Which cohort is the student in?"
    cohort = gets.chomp
    puts "What are your hobbies Sir/Madam?"
    hobbies = gets.chomp
    puts "Just curious... which country were you born in?"
    country_of_birth = gets.chomp
    puts "Last question... How tall are you? in cm please!"
    height = gets.chomp
end
  #return the array of students
  students
end

def checking_cohort(which_cohort)
  which_cohort = which_cohort.empty? ? "november" : which_cohort.downcase
  #To check if the user makes a typo, I am going to write the 12 possible months and if it does not match,
  #then it is clear the user has made a typo.
  possible_month = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  if possible_month.include? which_cohort
    return which_cohort
  else
    return possible_month[rand(12)]
  end
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
