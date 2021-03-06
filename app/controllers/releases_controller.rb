class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]

  # GET /releases
  # GET /releases.json
  def index
    @releases = Release.where(project_id: current_project_id)
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
  end

  # GET /releases/new
  def new
    @release = Release.new
  end

  # GET /releases/1/edit
  def edit
  end

  # POST /releases
  # POST /releases.json
  def create
    @release = Release.new(release_params)
    @release.project_id = current_project_id

    respond_to do |format|
      if @release.save
        format.html { redirect_to releases_path, notice: 'Release criado com sucesso.' }
        format.json { redirect_to releases_path :show, status: :created, location: @release }
      else
        format.html { render :new }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /releases/1
  # PATCH/PUT /releases/1.json
  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to releases_path, notice: 'Release atualizado com sucesso.' }
        format.json { redirect_to releases_path, status: :ok, location: @release }
      else
        format.html { render :edit }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release.destroy
    respond_to do |format|
      format.html { redirect_to releases_url, notice: 'Release deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release
      @release = Release.where(id: params[:id], project_id: current_project_id).first

      if @release.nil?
        redirect_to releases_url, notice: 'Release não encontrado.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_params
      params.require(:release).permit(:version, :deliver_date)
    end
end
