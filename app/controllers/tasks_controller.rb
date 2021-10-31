class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # before_action do
  #   redirect_to no_project_selected_path unless has_project_selected?
  # end

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to user_stories_path }
      else
        format.html { redirect_to user_stories_path, notice: 'Não foi possível salvar a tarefa!' }
        # format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task criada com sucesso!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_path }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :end_date, :start_date, :code, :status, :user_story_id, :kind_id, :priority_id)
    end
end
