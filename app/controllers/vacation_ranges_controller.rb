class VacationRangesController < ApplicationController
  before_action :set_vacation_range, only: %i[ show edit update destroy ]

  # GET /vacation_ranges or /vacation_ranges.json
  def index
    @vacation_ranges = VacationRange.all
  end
  
  # GET /vacation_ranges/1 or /vacation_ranges/1.json
  def show
  end

  # GET /vacation_ranges/new/
  def new
    @vacation_range = VacationRange.new(employee_id: params[:employee_id].to_i)
  end

  # GET /vacation_ranges/1/edit
  def edit
  end

  # POST /vacation_ranges or /vacation_ranges.json
  def create
    @vacation_range = VacationRange.new(vacation_range_params)

    respond_to do |format|
      if @vacation_range.save
        @vacation_range.touch
        format.html { redirect_to show_employee_ranges_url(@vacation_range.employee_id), notice: "Período de férias cadastrado com sucesso!" }
        format.json { render :show, status: :created, location: @vacation_range }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacation_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_ranges/1 or /vacation_ranges/1.json
  def update
    respond_to do |format|
      if @vacation_range.update(vacation_range_params)
        format.html { redirect_to vacation_range_url(@vacation_range), notice: "Período de férias atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @vacation_range }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacation_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacation_ranges/1 or /vacation_ranges/1.json
  def destroy
    @vacation_range.destroy

    respond_to do |format|
      format.html { redirect_to vacation_ranges_url, notice: "Período de férias deletado com sucesso!." }
      format.json { head :no_content }
    end
  end
  # GET /vacation_ranges/eligibles
  def show_vacation_eligibles
    @employees = Employee.where("hired_in <= ?", Date.today.years_ago(1)).where("vacation_days >= ?", 10)
  end
  # GET /vacation_ranges/employee/1
  def show_employee_ranges
    @vacation_ranges = Employee.find(params[:employee_id]).vacation_ranges
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_range
      @vacation_range = VacationRange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_range_params
      params.require(:vacation_range).permit(:start_date, :end_date, :employee_id)
    end
end
