AddressSchema = Dry::Schema.JSON do
  required(:street_name).filled(:string)
  required(:street_number).filled(:string)
  required(:zip_code).filled(:string)
  required(:comment).filled(:string)
  required(:latitude).filled(:float)
  required(:longitude).filled(:float)

  required(:country).filled(:hash) do
    required(:id).filled(:string)
  end

  required(:state).filled(:hash) do
    required(:name).filled(:string)
  end

  required(:city).filled(:hash) do
    required(:name).filled(:string)
  end

  required(:neighborhood).filled(:hash) do
    required(:name).filled(:string)
  end
  
end