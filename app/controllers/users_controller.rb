class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    authorize User
    if params[:search]
      @users = User.where("name || email LIKE ?", '%'"#{params[:search]}"'%').page(params[:page]).order('id DESC').per(10)  
    elsif current_user.admin? || current_user.coordenador?
     @users = User.page(params[:page]).order('id DESC').per(8)
    else
      redirect_to user_path   
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
     authorize User
  end

  # GET /users/new
  def new
    authorize User
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize User
  end

  # POST /users
  # POST /users.json
  def create
    authorize User
    @user = User.new(user_params)
    @user.password = '12345678'
    @user.password_confirmation= '12345678'

    respond_to do |format|
      if @user.save
        UserNotifierMailer.send_registered_email(@user).deliver
        format.html { redirect_to users_path, notice: 'Usuário criado com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1SS
  # PATCH/PUT /users/1.json
  def update
    authorize User
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Usuário atualizado com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize User
    @user.destroy
    respond_to do |format|
      UserNotifierMailer.send_delete_email(@user).deliver
      format.html { redirect_to users_url, notice: 'Usuário deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :group)
    end
end
