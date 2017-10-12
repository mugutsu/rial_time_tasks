class AccessToProjectsController < ApplicationController
    before_action :authenticate_user!
    #Создаем нового пользователя с правами к просмотру
    def new
        @project = Project.find(params[:project_id])
    end
    #Создаем
    def create
        @project = Project.find(params[:project_id])
        @access = @project.access_to_project.create(access_params)
        redirect_to project_path(@project)
    end
    #Удоляем права
    def destroy
        @project = Project.find(params[:project_id])
        @access = @project.access_to_project.find(params[:id])
        @access.destroy
        redirect_to project_path(@project)
    end

    private
        def access_params
          params.require(:access_to_project).permit(:user_id)
        end
end
