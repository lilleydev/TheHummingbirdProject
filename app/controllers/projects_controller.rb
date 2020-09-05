class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    binding.pry
    @project = current_user.created_projects.build(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
