class LabourAvailabilitiesController < ApplicationController
  before_action :set_labour_availability, only: [:show, :edit, :update, :destroy]

  # GET /labour_availabilities
  # GET /labour_availabilities.json
  def index
    @labour_availabilities = LabourAvailability.all
  end

  # GET /labour_availabilities/1
  # GET /labour_availabilities/1.json
  def show
  end

  # GET /labour_availabilities/new
  def new
    @labour_availability = LabourAvailability.new
  end

  # GET /labour_availabilities/1/edit
  def edit
  end

  # POST /labour_availabilities
  # POST /labour_availabilities.json
  def create
    @labour_availability = LabourAvailability.new(labour_availability_params)

    respond_to do |format|
      if @labour_availability.save
        format.html { redirect_to @labour_availability, notice: 'Labour availability was successfully created.' }
        format.json { render :show, status: :created, location: @labour_availability }
      else
        format.html { render :new }
        format.json { render json: @labour_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labour_availabilities/1
  # PATCH/PUT /labour_availabilities/1.json
  def update
    respond_to do |format|
      if @labour_availability.update(labour_availability_params)
        format.html { redirect_to @labour_availability, notice: 'Labour availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @labour_availability }
      else
        format.html { render :edit }
        format.json { render json: @labour_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labour_availabilities/1
  # DELETE /labour_availabilities/1.json
  def destroy
    @labour_availability.destroy
    respond_to do |format|
      format.html { redirect_to labour_availabilities_url, notice: 'Labour availability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labour_availability
      @labour_availability = LabourAvailability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labour_availability_params
      params.require(:labour_availability).permit(:labour_id, :day, :month, :schedule_id, :utilized)
    end
end
