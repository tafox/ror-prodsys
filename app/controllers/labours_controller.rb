class LaboursController < ApplicationController
  before_action :set_labour, only: [:show, :edit, :update, :destroy]

  # GET /labours
  # GET /labours.json
  def index
    @labours = Labour.all
  end

  # GET /labours/1
  # GET /labours/1.json
  def show
  end

  # GET /labours/new
  def new
    @labour = Labour.new
  end

  # GET /labours/1/edit
  def edit
  end

  # POST /labours
  # POST /labours.json
  def create
    @labour = Labour.new(labour_params)

    respond_to do |format|
      if @labour.save
        format.html { redirect_to @labour, notice: 'Labour was successfully created.' }
        format.json { render :show, status: :created, location: @labour }
      else
        format.html { render :new }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labours/1
  # PATCH/PUT /labours/1.json
  def update
    respond_to do |format|
      if @labour.update(labour_params)
        format.html { redirect_to @labour, notice: 'Labour was successfully updated.' }
        format.json { render :show, status: :ok, location: @labour }
      else
        format.html { render :edit }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labours/1
  # DELETE /labours/1.json
  def destroy
    @labour.destroy
    respond_to do |format|
      format.html { redirect_to labours_url, notice: 'Labour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labour
      @labour = Labour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labour_params
      params.require(:labour).permit(:employee_id, :name)
    end
end
