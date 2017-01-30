
@students = []

def interactive_menu
  loop do
  #1. print the mnu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
  #2. Read the input and save it onto a variable
  selection = gets.chomp
  #3. Do what the user has asked
  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit #This causes the program to terminate
  else
    puts 'I dont know what you mean, try again...'
end
end
end

def input_students
  puts "Please enter the first student's name"
  puts "To finish, type 'quit' all lower case!"
  #Creating an empty array to store values in
  students = []
  #Get the name
  name = gets.strip
  #Get the information about the Cohort
  puts "Which cohort do they belong to?"
  cohort = gets.strip
  if cohort.empty?
    cohort = "February"
  else
    cohort = cohort
  end

  #While the name is not empty, repeat the code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    #Get another student's name
    name = gets.chomp
    #break if name.downcase == "quit"
    break if name.downcase == "quit"
    puts "Which cohort do they belong to?"
    cohort = gets.chomp
    #Assign February is invalid answer given
    if cohort.empty?
      cohort = "february"
      #checking and confirming the month
    elsif cohort == "january" || cohort == "february" || cohort == "march" || cohort == "april" || cohort == "may" || cohort == "june" || cohort == "july" || cohort == "august" || cohort == "september" || cohort == "october" || cohort == "november" || cohort == "december"
      cohort = cohort
    else
      #Re ask to enter a valid answer if none matches
      puts "Make sure to check and spell your answer! Try again please!"
      cohort = gets.chomp
    end
  end
  students
end

#Method which prints the header
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------".center(30)
end

def print(students)
  students.sort_by do |student|
    student[:cohort]
    puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"

end

interactive_menu
