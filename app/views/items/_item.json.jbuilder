json.extract! item, :id, :title, :url, :purchased, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
