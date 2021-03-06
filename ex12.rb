@students = [] #An empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "Hit return twice to finish"
  #get the first name
  name = gets.chomp
  #While the name is not empty, repeat this code
  while !name.empty? do
    #Add the student hash to the array
    @students << {name: name, cohort: :february}
    puts "Now we have #{@students.count} students"
    #Get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
    loop do
      print_menu
      process(gets.chomp)
    end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the file from the students.csv"
  puts "9. Exit" # 0 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  #Open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    #Student_data stores the name and cohort and converts it into an ARRAY
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "Not sure what you meant... try again!"
  end
end

#Method which prints the header
def print_header
  puts "The students of Villains Academy"
  puts "-----------------------".center(30)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"

end

interactive_menu
