json.array!(@raw_material_products) do |raw_material_product|
  json.extract! raw_material_product, :id, :product_id, :rawmaterial_id, :quantity
  json.url raw_material_product_url(raw_material_product, format: :json)
end
