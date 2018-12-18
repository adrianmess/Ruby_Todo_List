module Menu
	def menu
		puts "Welcome the ToDo List App.
				Here are a list of options:
				1) Add
				2) Show
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
		end
	end
end