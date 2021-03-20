class TodosController< ApplicationController
    def index 
        #render plain: Todo.order(:due_date).map{|todo|todo.to_pleasant_string}.join("\n")
        render "index"
    end

    def show
        id =params[:id]
        todo= Todo.find(id)
        render plain: todo.to_pleasant_string
    end

    def create 
        todo_text=param[:todo_text]
        due_date=DateTime.parse(params[:due_date])
        new_todo=Todo.create!(
            todo_text: todo_text,
            due_date: due_date,
            completed:false,
        )

        response_text= "Hey, your new todo is added"
        render plain: response_text
    end

    def update
        id=params[:id]
        completed=params[:completed]
        todo = todo.find(id)
        todo.completed =completed
        todo.save!
        render plain: "updated the todo completed status to #{completed}"
    end

    
    
end