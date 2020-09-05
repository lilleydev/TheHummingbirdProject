class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  def new
    @project = Project.new
  end

  def create
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

  def show; end

  def edit; end

  def update
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

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project has been deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find_by(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
