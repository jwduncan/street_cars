json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :vehicle, :date, :desc, :mileage, :category, :cost
  json.url vehicle_url(vehicle, format: :json)
end
