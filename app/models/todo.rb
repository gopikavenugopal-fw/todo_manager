class Todo< ActiveRecord::Base

    def to_pleasant_string
        is_completed=completed ? "[X]" : "[]"
        "#{id}. #{todo_text} #{is_completed} on #{due_date.to_s(:short)}"
    end
end