#Displaying the students by cohort
#Making a list of existing cohorts, in the students array

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
    puts "Now we have #{students.count} student#{sing_plural(students)}"
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

def sing_plural(students)
  students.count > 1 ? 's' : ''
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

#Creating a method, which gets the list of unique cohorts from students array
def present_students(students)
  all_present_students = students.map do |student|
    student[:cohort]
  end.uniq
  #Uniq returns a new array by removing duplicate values in self. If a block is given,
  #it will use the return value of the block for comparison.
  # a = ['a', 'a', 'b', 'b', 'c']
  # a.uniq => ['a', 'b', 'c']
end

def print_header(students)
  puts "The student#{sing_plural(students)} of Villains Academy"
  puts "----------------"
end

#Printing the students which are grouped by the cohorts they are from
def print(students)
  all_present_students = present_students(students)
  all_present_students.each do |cohort|
    puts "The students in #{cohort} cohort are..."
    students.each do |student|
      puts "#{student[:name]}" if student[:cohort] == cohort
end
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{sing_plural(students)}"
end
#We still need to call the methods to invoke it

students = input_students
print_header(students)
print(students)
print_footer(students)
