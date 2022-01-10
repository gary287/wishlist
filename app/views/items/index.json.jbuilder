json.list do
  json.partial! 'lists/list', list: @list
end

json.items do
  json.array! @items, partial: 'items/item', as: :item
end
