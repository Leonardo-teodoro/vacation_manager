class VacationRangesController < ApplicationController
  before_action :set_vacation_range, only: %i[ show edit update destroy ]

  # GET /vacation_ranges or /vacation_ranges.json
  def index
    @vacation_ranges = VacationRange.all
  end

  # GET /vacation_ranges/1 or /vacation_ranges/1.json
  def show
  end

  # GET /vacation_ranges/new
  def new
    @vacation_range = VacationRange.new
  end

  # GET /vacation_ranges/1/edit
  def edit
  end

  # POST /vacation_ranges or /vacation_ranges.json
  def create
    @vacation_range = VacationRange.new(vacation_range_params)

    respond_to do |format|
      if @vacation_range.save
        format.html { redirect_to vacation_range_url(@vacation_range), notice: "Vacation range was successfully created." }
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
        format.html { redirect_to vacation_range_url(@vacation_range), notice: "Vacation range was successfully updated." }
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
      format.html { redirect_to vacation_ranges_url, notice: "Vacation range was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_range
      @vacation_range = VacationRange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_range_params
      params.require(:vacation_range).permit(:start_date, :end_date)
    end
end
