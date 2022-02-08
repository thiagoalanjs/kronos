class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :select, :scrumboard, :chart]
  caches_action :index, layout: false, expires_in: 5.minutes
  
  def select
    session[:project] = @project.id
    redirect_to @project
  end

  def chart
  end

  def scrumboard
  end

  def index
    if params[:search]
      @projects = Project.where("name LIKE ?", '%'"#{params[:search]}"'%').page(params[:page]).order('id DESC').per(8)  
    elsif current_user.admin? || current_user.coordenador?
      @projects = Project.page(params[:page]).order('id DESC').per(9)  
    else
      redirect_to user_project_path
    end
  end

  def user_project 
    @projects = current_user.projects
    render :index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: "Projeto #{@project.name} criado com sucesso!" }
      else
        format.html { render :new, notice: "Houve um erro ao criar o projeto." }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    session[:project] = nil
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Projeto #{@project.name} deletado com sucesso!" }    
    else
      format.html { render :new, notice: "Houve um erro ao deletar o projeto." }
    end
  end

  protected
  
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :initial,:description, :size, :difficulty, :priority_id, :start_date, :end_date)
    end
end
