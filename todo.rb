#create a Todo List -  the class List handles actions implemented on a List object.
class List
    attr_reader :all_tasks


    def initialize
        @all_tasks = []
    end

    #method adds task to all_tasks array
    def add(task)
        @all_tasks << task
    end

    def show
        all_tasks
    end

end

#add tasks to list - manages actions that can be implemented on a task object
class Task
    attr_reader :description

    def initialize(description)
        @description = description
    end
end

#Program runner
if __FILE__ == $PROGRAM_NAME
    my_list = List.new
    puts "You have created a new list"
    my_list.add(Task.new('Make Breakfast'))
    puts 'You have added a task to the Todo List'
end