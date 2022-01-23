class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 
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
        format.html { redirect_to user_stories_path, notice: "Tarefa TK-#{@task.user_story.project.initial}-#{@task.id} criada com sucesso!"  }
      else
         format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_path, notice: "Tarefa TK-#{@task.user_story.project.initial}-#{@task.id} atualizada com sucesso!" }
      else 
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_path, notice: "Tarefa TK-#{@task.user_story.project.initial}-#{@task.id} deletada com sucesso!" }
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :status, :impediment, :user_story_id, :kind_id, :priority_id, :function_user_project_id, :user_id)
    end
end


