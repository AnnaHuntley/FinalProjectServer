json.array! @memories do |memory|
  json.extract! memory, :id, :title, :description, :date, :location, :user_id, :created_at, :updated_at
  json.url memory_url(memory, format: :json)

  if memory.photo.attached?
    json.photo_url rails_blob_path(memory.photo, only_path: true)
  else
    json.photo_url nil
  end
end