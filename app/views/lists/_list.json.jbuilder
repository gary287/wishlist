json.extract! list, :id, :title, :shared_id, :created_at, :updated_at
json.url list_items_url(list, format: :json)
