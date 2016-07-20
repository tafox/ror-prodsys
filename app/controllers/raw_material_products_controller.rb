class RawMaterialProductsController < ApplicationController
  before_action :set_raw_material_product, only: [:show, :edit, :update, :destroy]

  # GET /raw_material_products
  # GET /raw_material_products.json
  def index
    @raw_material_products = RawMaterialProduct.all
  end

  # GET /raw_material_products/1
  # GET /raw_material_products/1.json
  def show
  end

  # GET /raw_material_products/new
  def new
    @raw_material_product = RawMaterialProduct.new
  end

  # GET /raw_material_products/1/edit
  def edit
  end

  # POST /raw_material_products
  # POST /raw_material_products.json
  def create
    @raw_material_product = RawMaterialProduct.new(raw_material_product_params)

    respond_to do |format|
      if @raw_material_product.save
        format.html { redirect_to @raw_material_product, notice: 'Raw material product was successfully created.' }
        format.json { render :show, status: :created, location: @raw_material_product }
      else
        format.html { render :new }
        format.json { render json: @raw_material_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_material_products/1
  # PATCH/PUT /raw_material_products/1.json
  def update
    respond_to do |format|
      if @raw_material_product.update(raw_material_product_params)
        format.html { redirect_to @raw_material_product, notice: 'Raw material product was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_material_product }
      else
        format.html { render :edit }
        format.json { render json: @raw_material_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_material_products/1
  # DELETE /raw_material_products/1.json
  def destroy
    @raw_material_product.destroy
    respond_to do |format|
      format.html { redirect_to raw_material_products_url, notice: 'Raw material product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_material_product
      @raw_material_product = RawMaterialProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_material_product_params
      params.require(:raw_material_product).permit(:product_id, :rawmaterial_id, :quantity)
    end
end
