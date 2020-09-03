class ProjectsController < ApplicationController
  before_action :redirect_if_logged_out

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
