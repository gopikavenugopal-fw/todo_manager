class ApplicationController < ActionController::Base

    def create 
        todo_text = param[:todo_text]
        due_date = DateTime.parse(params[:due_date])
        new_todo = Todo.create!(
            todo_text: todo_text,
            due_date: due_date,
            completed: false,
        )

        redirect_to todos_path
    end
end
