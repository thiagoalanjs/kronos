class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.where(project_id: current_project_id).page(params[:page]).order('id DESC').per(8) 
  end

  # def index
  #   if params[:search]
  #     @sprints = Sprint.where("name LIKE ?", '%'"#{params[:search]}"'%').page(params[:page]).order('id DESC').per(8)  
  #   else
  #    redirect_to sprints_path
  #   end
  # end


  # GET /sprints/1
  # GET /sprints/1.json
  def show
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(sprint_params)
    @sprint.project_id = current_project_id

    respond_to do |format|
      if @sprint.save
        UserSprintNotifierMailer.send_create_sprint_email(@sprint).deliver
        format.html { redirect_to sprints_path, notice: 'Sprint criada com sucesso.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        UserSprintNotifierMailer.send_update_sprint_email(@sprint).deliver
        format.html { redirect_to sprints_path, notice: 'Sprint atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
      UserSprintNotifierMailer.send_delete_sprint_email(@sprint).deliver
    respond_to do |format|
      format.html { redirect_to sprints_path, notice: 'Sprint deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  def change_status
    respond_to do |format|
       @sprint = Sprint.where(id: params[:id], project_id: current_project_id).first 
      if @sprint.update(sprint_status: "FINALIZADA") 
        UserSprintNotifierMailer.send_complete_sprint_email(@sprint).deliver       
        format.html { redirect_to sprints_path, notice: 'Sprint finalizada com sucesso.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { redirect_to sprints_path }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.where(id: params[:id], project_id: current_project_id).first

      if @sprint.nil?
        redirect_to sprints_path, notice: 'Sprint não encontrada.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:name, :start_date, :end_date, :planning_start_date, :planning_end_date, :execution_start_date, :execution_end_date, :review_meeting_date, :retrospective_meeting_date, :release_id)
    end

end
