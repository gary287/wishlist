json.extract! item, :id, :title, :url, :purchased, :list_id, :created_at, :updated_at
json.url list_items_url(item, format: :json)
