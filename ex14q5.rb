#Instead of hardcoding save_students() and load_students()
#We ask the user to enter a filename. It if doesn't exist, we display a message
#ask_file() created to get retrieve user input


@students = [] #An empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the file from the students.csv"
  puts "9. Exit" # 0 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
      puts "Thank you for your time. Hope to see you again!"
      exit
    else
      puts "Not sure what you meant... try again!"
    end
  end


def input_students
  puts "You chose to input students to the list!"
  puts "Please enter the names of the students"
  puts "Hit return twice to finish"
  #get the first name
  name = STDIN.gets.chomp
  #While the name is not empty, repeat this code
  while !name.empty? do
    #Add the student hash to the array
    add_students(name, :february)
    puts "Now we have #{@students.count} students"
    #Get another name from the user
    name = STDIN.gets.chomp
  end
  #Here, we are not returning anything because the @students array gets changed and updated
end

def show_students
  puts "You've requsted to see the list of students!"
  print_header
  print_students_list
  print_footer
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

def save_students(filename)
  if File.exists?(filename)
  puts "You chose to save the student list to the 'students.csv' file!"
  #Open the file for writing
  file = File.open(filename, "w")
  #iterate over the array of students
  @students.each do |student|
    #Student_data stores the name and cohort and converts it into an ARRAY
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "#{students.count} students saved to file"
else
  file_nonexistent
end
end

def load_students(filename)
  if File.exists?(filename)
  puts "You chose to load the student list from the #{filename} file!"
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
  puts "Loading #{@students.count} names from #{filename}"
else
  file_nonexistent
end
end

def try_load_students
  #students.csv will be uploaded by default
  filename = ARGV.first || "students.csv"#first argument from the command line
  return if filename.nil? #Get out of the method if it isn't given
  if File.exists?(filename) # If it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #Quit the program
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def ask_file
  print "Which file would you like to open?"
  answer = STDIN.gets.chomp
end

def file_nonexistent
  puts "Sorry, this file is non-existent, please try again."
  puts ""
  interactive_menu
end

interactive_menu
