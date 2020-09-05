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

  def edit
    @project = Project.find_by(params[:id])
  end

  def update
    @project = Project.find_by(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
