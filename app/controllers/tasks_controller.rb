class TasksController < ApplicationController

    before_action :authenticate_user!

  def index
      @project = Project.find(params[:project_id])
      ActionCable.server.broadcast('task', project_id: @project.id)
  end
  #Сохраняем задачу
  def create
      @project = Project.find(params[:project_id])
      @task = @project.task.create(task_params)
      redirect_to project_tasks_path(@project)
  end
  #Удоляем задачу
  def destroy
      @project = Project.find(params[:project_id])
      @task = @project.task.find(params[:id])
      @task.destroy
      redirect_to project_tasks_path(@project)
  end
  #Изменяем значение
  def update_done
    @task = Task.find(params[:task][:id])
    @task.update(params.require(:task).permit(:id,:done))
  end

  private
    def task_params
        params.require(:task).permit(:name,:priority)
    end
end
