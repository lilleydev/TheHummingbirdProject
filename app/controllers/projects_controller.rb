class ProjectsController < ApplicationController
  before_action :redirect_if_logged_out

  def new
    @project = Project.new
  end

  def create
    binding.pry
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project
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
