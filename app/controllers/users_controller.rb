class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @classroom = Subject.all.order(:subject_name)
    @student = Student.all.order(:first_name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def assign_homework
  end
    

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def list
    @student = Student.all
  end

  def list_teacher
    @teacher = User.where(role: "teacher")
  end

  def list_client
    @client = User.where(role: "client")
  end

  def list_student
    @student = Student.where(user_id: current_user.id)
  end

  def list_grades
  end

  def list_grades_clients
  end

  def list_homework
  end

  def create_teacher
     @user = user_from_params

    # Check if current user is nil , admin or teacher. If admin then create teacher, if teacher then create student, if nil then create admin.
      respond_to do |format|
        if @user.save
          format.html { redirect_to '/', notice: 'Teacher was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

   def create_client
     @user = user_from_params

    # Check if current user is nil , admin or client. If admin then create client, if nil then create admin.
      respond_to do |format|
        if @user.save
          format.html { redirect_to '/', notice: 'Client was successfully registered.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # POST /users
  # POST /users.json
  def create
    @user = user_from_params

    # Check if current user is nil , admin or teacher. If admin then create teacher, if teacher then create student, if nil then create admin.
      respond_to do |format|
        if @user.save
          format.html { redirect_to '/', notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_from_params
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    gender = user_params.delete(:gender)
    phone = user_params.delete(:phone)
    avatar = user_params.delete(:avatar)
    role = user_params.delete(:role)


    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.phone = phone
      user.password = password
      user.gender = gender
      user.avatar = avatar
      user.role = role
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def permit_params
      params.require(:user).permit(:first_name,:last_name,:email,:password, :phone,:gender, :avatar, :role)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[Clearance.configuration.user_parameter] || Hash.new
    end
end

