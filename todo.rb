#create a Todo List
class List

end

#add tasks to list
class Task
    attr_reader :description
end


if __FILE__ == $PROGRAM_NAME
    my_list = List.new
    puts "You have created a new list"
end