json.array!(@articles) do |article|
  json.extract! article, :id, :description
  json.url article_url(article, format: :json)
end
