class Todo< ActiveRecord::Base
    validates :todo_text, presence: true
    validates :todo_text, length: {minimum: 2 }
    validates :due_date, presence: true

    belongs_to :user

    def to_pleasant_string
        is_completed=completed ? "[X]" : "[]"
        "#{id}. #{todo_text} #{is_completed} on #{due_date.to_s(:short)}"
    end

    def due_today? 
        due_date == Date.today 
    end

    def of_user(user)
        all.where(user_id: user.id)
    end

    def self.show_list
        all.map{ |todo| todo.to_pleasant_string}
    end

    def self.overdue
        all.where( "due_date < ?", Date.today)
    end

    def self.due_today
        all.where("due_date= ? ", Date.today)

    end

    def self.due_later
        all.where("due_date > ?", Date.today)
    end

    def self.completed
        all.where(completed: true)
    end
    
    def self.show
        all.where(completed: false)
    end

    
end