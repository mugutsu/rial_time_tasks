class ProjectsController < ApplicationController

    before_action :authenticate_user!

    def index
    #   @project_list = Project.where(user_id: current_user.id)
        @project_list = Project.where('user_id=? OR id in (?)', current_user.id, AccessToProject.need_id(current_user))
        # render AccessToProject.need_id(current_user)
    end
    #Создание проекта
    def new
      @project = Project.new
    end
    #Создание проекта
    def create
      @project = Project.new(project_params)
      @project.user_id = current_user.id
      if @project.save
          redirect_to @project
      else
          render 'new'
      end
    end
    #Редактирование
    def edit
      @project = Project.find(params[:id])
    end
    #Сохраняем изменения
    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
          redirect_to @project
      else
          render 'edit'
      end
    end
    #Открытие проекта для просмотре
    def show
      @project = Project.find(params[:id])
    end
    #Удоляем
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
    end
    #Что-бы убрать дуближи
    private
        def project_params
            params.require(:project).permit(:name, :comment)
        end
end
