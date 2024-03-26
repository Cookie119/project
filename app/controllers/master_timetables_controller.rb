class MasterTimetablesController < ApplicationController
  before_action :set_master_timetable, only: %i[ show edit update destroy ]

  # GET /master_timetables or /master_timetables.json
  def index
    @master_timetables = MasterTimetable.all
  
    if params[:time_slot_id].present?
      @master_timetables = @master_timetables.where(time_slot_id: params[:time_slot_id])
    end
    
    if params[:subject_id].present?
      @master_timetables = @master_timetables.where(subject_id: params[:subject_id])
    end
  
    if params[:division_id].present? # Use division_id parameter here
      @master_timetables = @master_timetables.where(division_id: params[:division_id])
    end
    
    if params[:day_id].present? # Use day_id parameter here
      @master_timetables = @master_timetables.where(day_id: params[:day_id])
    end
    
    if params[:teacher_id].present? # Use teacher_id parameter here
      @master_timetables = @master_timetables.where(teacher_id: params[:teacher_id])
    end
  
    @master_timetables = @master_timetables.includes(:day, :time_slot, :subject, :division, :teacher)
  end
  

  # GET /master_timetables/1 or /master_timetables/1.json
  def show
  end

  # GET /master_timetables/new
  def new
    @master_timetable = MasterTimetable.new
  end

  # GET /master_timetables/1/edit
  def edit
  end

  # POST /master_timetables or /master_timetables.json
  def create
    @master_timetable = MasterTimetable.new(master_timetable_params)

    respond_to do |format|
      if @master_timetable.save
        format.html { redirect_to master_timetable_url(@master_timetable), notice: "Master timetable was successfully created." }
        format.json { render :show, status: :created, location: @master_timetable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_timetables/1 or /master_timetables/1.json
  def update
    respond_to do |format|
      if @master_timetable.update(master_timetable_params)
        format.html { redirect_to master_timetable_url(@master_timetable), notice: "Master timetable was successfully updated." }
        format.json { render :show, status: :ok, location: @master_timetable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_timetables/1 or /master_timetables/1.json
  def destroy
    @master_timetable.destroy!

    respond_to do |format|
      format.html { redirect_to master_timetables_url, notice: "Master timetable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_timetable
      @master_timetable = MasterTimetable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_timetable_params
      params.require(:master_timetable).permit(:subject_id, :teacher_id, :day_id, :time_slot_id, :division_id)
    end
end
