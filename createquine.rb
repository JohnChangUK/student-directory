#A quine is essentially a self-replicating program which takes no Input
#and produces a copy of its own source code as it's only output


#$0 is the name of the file used to start the program.


#https://blog.chaps.io/2015/10/01/generating-quines-in-ruby.html
src = "\nputs \"src=\" + src.inspect + src"

puts "src = " + src.inspect + src
