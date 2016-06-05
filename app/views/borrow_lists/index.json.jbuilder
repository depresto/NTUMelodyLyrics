json.array!(@borrow_lists) do |borrow_list|
  json.extract! borrow_list, :id
  json.url borrow_list_url(borrow_list, format: :json)
end
