class Task::TaskFormComponent < ApplicationComponent

 def initialize(card:, task:)
    @card = card
    @task = task
  end
end
