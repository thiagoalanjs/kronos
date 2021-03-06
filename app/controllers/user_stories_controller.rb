class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]
  
  def index
      @user_stories = UserStory.where(project_id: current_project_id).page(params[:page]).order('priority_id ASC').per(8)
      @tasks =  Task.where(user_story_id: @user_stories).order('priority_id DESC')
  end

  def show
  end

  def new
    @user_story = UserStory.new
  end

  def edit
  end

  def create
    @user_story = UserStory.new(user_story_params)
    @user_story.project_id = current_project_id

    respond_to do |format|
      if @user_story.save
        UserStoryNotifierMailer.send_create_user_story_email(@user_story).deliver
        format.html { redirect_to user_stories_url, notice: 'User story foi criada com sucesso!!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_story.update(user_story_params)
        UserStoryNotifierMailer.send_update_user_story_email(@user_story).deliver
        format.html { redirect_to user_stories_url, notice: 'User story foi atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: 'User story foi deletada com sucesso.' }
      UserStoryNotifierMailer.send_delete_user_story_email(@user_story).deliver
    end
  end

  private
    def set_user_story
      @user_story = UserStory.where(id: params[:id], project_id: current_project_id).first

      if @user_story.nil?
        redirect_to user_stories_url, notice: 'User story não encontrada.'
      end
    end

    def user_story_params
      params.require(:user_story).permit(:title, :description, :business_value, :story_points, :status, :priority_id, :sprint_id)
    end
end
