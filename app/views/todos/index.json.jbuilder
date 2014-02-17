json.array!(@todos) do |todo|
  json.extract! todo, :id, :content, :category
  json.url todo_url(todo, format: :json)
end
