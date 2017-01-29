# Remove "\n"(newline characters) from a string. delete(), tr(), strip() methods.
#When referencing newline characters, always use double quotes ""

def input_students
  puts "Please enter the names of the students"

  #get the first name
  name = gets.delete("\n")
  #Get the value of the cohort
  puts "Which cohort is this student in?"
  cohort = gets.delete("\n")
  #Create an empty array, to store our values in
  students = []
  puts "To finish, just hit return twice"
  #While the name is not empty, repeat this code
  puts "What are your hobbies Sir/Madam?"
  hobbies = gets.delete("\n")
  puts "Just curious... which country were you born in?"
  country_of_birth = gets.delete("\n")
  puts "Last question... How tall are you? in cm please!"
  height = gets.delete("\n")
  #While the name is not empty, repeat this code
  while !name.empty? do
    cohort = checking_cohort(cohort) #Default value will be November
    #add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth,
    height: height}
    puts "Now we have #{students.count} student#{sing_plural(students)}"
    #get another name from the user
    puts "What is the other student's name?"
    # .tr returns a copy if the str with the characters in from_Str,
    #replaced by corresponding characters in to_str
    #"hello".tr('el', 'ip') => "hippo"
    name = gets.tr("\n", "")
    break if name.empty?
    puts "Which cohort is the student in?"
    #strip removes any white space and any "\n", "\t", "\r" etc.
    cohort = gets.strip
    puts "What are your hobbies Sir/Madam?"
    hobbies = gets.strip
    puts "Just curious... which country were you born in?"
    country_of_birth = gets.strip
    puts "Last question... How tall are you? in cm please!"
    height = gets.strip
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
      #.compact removes all nil elements
      #['a', nil, 'b', nil].compact => ['a', 'b']
end.compact
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
