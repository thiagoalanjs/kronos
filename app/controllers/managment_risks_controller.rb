class ManagmentRisksController < ApplicationController
  before_action :set_managment_risk, only: %i[ show edit update destroy ]

  # GET /managment_risks or /managment_risks.json
  def index
    @managment_risks = ManagmentRisk.where(project_id: current_project_id)
  end

  # GET /managment_risks/1 or /managment_risks/1.json
  def show
  end

  # GET /managment_risks/new
  def new
    #@managment_risk = ManagmentRisk.where(project_id: current_project_id).page(params[:page]).order('id DESC').per(8)
    @managment_risk = ManagmentRisk.new
  end

  # GET /managment_risks/1/edit
  def edit
  end

  # POST /managment_risks or /managment_risks.json
  def create
    @managment_risk = ManagmentRisk.new(managment_risk_params)
    @managment_risk.project_id = current_project_id

    respond_to do |format|
      if @managment_risk.save
        format.html { redirect_to managment_risk_url(@managment_risk), notice: "Gerenciamento de risco criado com sucesso." }
        format.json { render :show, status: :created, location: @managment_risk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @managment_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managment_risks/1 or /managment_risks/1.json
  def update
    respond_to do |format|
      if @managment_risk.update(managment_risk_params)
        format.html { redirect_to managment_risk_url(@managment_risk), notice: "Gerenciamento de risco atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @managment_risk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @managment_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managment_risks/1 or /managment_risks/1.json
  def destroy
    @managment_risk.destroy

    respond_to do |format|
      format.html { redirect_to managment_risks_url, notice: "Gerenciamento de risco deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managment_risk
      @managment_risk = ManagmentRisk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def managment_risk_params
      params.require(:managment_risk).permit(:title, :description, :probabitity, :contingency, :status, :project_id)
    end
end
