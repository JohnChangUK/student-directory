@name = ""
@cohort = ""
@file = "students.csv"
@students = []

require 'csv'

def interactive_menu
  loop do
    print_menu
    request = STDIN.gets.chomp
    puts "You have requested number #{request}!"
    process(request)
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
    exit #Causes the program to terminate
  else
    puts "I'm not sure what you meant... Please try again!"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load the list of students"
  puts "9. EXIT"
end

def get_students
  @name = STDIN.gets.chomp
end

def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  get_students
  while !@name.empty? do
    add_students
    puts "Now we have #{@students.count} students"
    get_students
  end
  end

  def show_students
    if @students.length >= 1
      print_header
      print_students_list
      print_footer
    else
      puts "Please add some students to the list. We noticed you havn't put any yet!"
    end
  end

  def print_header
    puts "The students of Makers Academy!"
    puts "-" * 20
  end

  def print_students_list
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end

  def print_footer
    if @students.length == 1
      puts "We have 1 great student!"
    else
      puts "Overall, we have #{@students.count} great students!"
    end
  end

  def ask_file
    puts "Which file would you like to open?"
    puts "If no option is given, a default 'students.csv' file will be opened"
    @file = STDIN.gets.chomp
  end

  def save_students
    ask_file
    CSV.open(@file, "w") do |csv|
      @students.each do |student|
        student_info = [student[:name], student[:cohort]]
        csv << student_info
      end
    end
  end

  def load_students
    ask_file
    CSV.open(@file, "r") do |csv|
      csv.readlines each do |line|
        @name, @cohort = line[0], line[1]
        add_students
      end
    end
  end

  def add_students
    @students << {name: @name, cohort: :february}
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #Get out of the method if it isn't given.
  if File.exists?(filename) #If the file exists.
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    load_students(filename = "students.csv")
    puts "We loaded 'students'csv' as the requested file #{filename} does not exist."
    exit
  end
end

try_load_students
interactive_menu
