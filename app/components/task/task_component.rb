class Task::TaskComponent < ApplicationComponent

  def initialize(task:)
    @task = task
    @card = @task.card
  end
end
