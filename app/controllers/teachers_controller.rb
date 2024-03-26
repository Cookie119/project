class TeachersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
    @teachers = @teachers.where(designation_id: params[:designation_id]) if params[:designation_id].present?
  end
  
  

  # GET /teachers/1 or /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])
    @designation = Designation.find(@teacher.designation_id)
    @department = Department.all
    @designation = Designation.all  
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @department = Department.all
    @designation = Designation.all  
  end

  # GET /teachers/1/edit
  def edit
    @department = Department.all
    @designation = Designation.all  
  end

  # POST /teachers or /teachers.json
  def create
    @department = Department.all
    @designation = Designation.all  
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update 
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy!

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:name, :image, :qualification, :experience, :area_of_expertise, :designation_id, :department_id) 
    end    
end
