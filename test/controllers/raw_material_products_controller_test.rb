require 'test_helper'

class RawMaterialProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw_material_product = raw_material_products(:one)
  end

  test "should get index" do
    get raw_material_products_url
    assert_response :success
  end

  test "should get new" do
    get new_raw_material_product_url
    assert_response :success
  end

  test "should create raw_material_product" do
    assert_difference('RawMaterialProduct.count') do
      post raw_material_products_url, params: { raw_material_product: { product_id: @raw_material_product.product_id, quantity: @raw_material_product.quantity, rawmaterial_id: @raw_material_product.rawmaterial_id } }
    end

    assert_redirected_to raw_material_product_url(RawMaterialProduct.last)
  end

  test "should show raw_material_product" do
    get raw_material_product_url(@raw_material_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_raw_material_product_url(@raw_material_product)
    assert_response :success
  end

  test "should update raw_material_product" do
    patch raw_material_product_url(@raw_material_product), params: { raw_material_product: { product_id: @raw_material_product.product_id, quantity: @raw_material_product.quantity, rawmaterial_id: @raw_material_product.rawmaterial_id } }
    assert_redirected_to raw_material_product_url(@raw_material_product)
  end

  test "should destroy raw_material_product" do
    assert_difference('RawMaterialProduct.count', -1) do
      delete raw_material_product_url(@raw_material_product)
    end

    assert_redirected_to raw_material_products_url
  end
end
