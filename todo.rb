module Menu
	def menu
		puts "Welcome the ToDo List App.
				Here are a list of options:
				1) Add
				2) Show
				3) Delete a task from the list
				4) Write list to a File
				5) Read list from a File
				Q) Quit "
	end

	def show
		menu
	end
end

module Promptable
	def prompt(message = 'What would you like to do?', symbol = ':> ')
		print message
		print symbol
		gets.chomp
	end
end


#create a Todo List -  the class List handles actions implemented on a List object.
#manages the behavior of an individual list
class List
	attr_reader :all_tasks


	def initialize
		@all_tasks = []
	end

	#method adds task to all_tasks array
	def add(task)
		@all_tasks << task
	end

	#method displays all tasks
	def show
		@all_tasks
		# .select { |i| puts i.include?()}
	end

	#allows a user of the Todo List program to write tasks to a file.
	#It should take the filename as an argument and output the description
	#of the tasks in the all tasks array as a list.
	def write_to_file(filename)
		IO.write(filename, @all_tasks.map(&:to_s).join("\n"))
	end

	def read_from_file(filename)
		IO.readlines(filename).each do |line|
			add(line.chomp)
		end
	end
end

#add tasks to list - manages actions that can be implemented on a task object
#manages the behavior of an individual task.
class Task
	attr_reader :description

	def initialize(description)
		@description = description
	end
end

#Program runner
if __FILE__ == $PROGRAM_NAME
	my_list = List.new
	include Menu
	include Promptable
	# puts menu
	# puts prompt
	#Until the user quits, display the menu and prompt the user for their input
	until 'q'.include?(user_input = prompt(*show).downcase)
		case user_input
			when "1" then my_list.add(prompt('What is it you would like to add?'))
			when "2" then puts my_list.show
			when "3" then my_list.write_to_file(prompt("Please enter filename"))
			when '4'
				begin
					 my_list.read_from_file(prompt("Please enter filename"))
				rescue Errno::ENOENT
					puts 'File name not found, please verify your file name
				  and path.'
				end
			else puts "I don't understand that response"
		end
		prompt('Press enter to continue', '')
	end
			puts "Thanks for using the menu system!"
end