module Menu

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
    puts "You have created a new list"
    my_list.add('Make Breakfast')
    my_list.add('Study Ruby')
    my_list.add('Send bday card to Mom')
    puts 'You have added a task to the Todo List'
    puts my_list.show
end