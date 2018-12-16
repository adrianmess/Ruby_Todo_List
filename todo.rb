#create a Todo List -  the class List handles actions implemented on a List object.
class List
    attr_reader :all_tasks

    def initialize
        @all_tasks = []
    end
end

#add tasks to list - manages actions that can be implemented on a task object
class Task
    attr_reader :description

    def initialize(description)
        @description = description
    end
end


if __FILE__ == $PROGRAM_NAME
    my_list = List.new
    puts "You have created a new list"
end