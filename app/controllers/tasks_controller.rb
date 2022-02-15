class TasksController < ApplicationController
  before_action :set_card, :set_task

  def create
    @task = Task.new(task_params)

    if @task.save
      # create.turbo_stream.slim
    else
      redirect_to root_path
    end
  end

  def update
    if @task.update(task_params)
      head :ok
    else
      redirect_to root_path
    end
  end

  def destroy
    @task.destroy
    head :ok
  end

  private
    def set_task
      @task = Task.find(params[:id]) if params[:id]
    end

    def set_card
      @card = Card.find(params[:card_id]) if params[:card_id]
    end

    def task_params
      params.require(:task).permit(:card_id, :description, :completed)
    end
end
