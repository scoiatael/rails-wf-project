json.array!(@events) do |event|
  json.extract! event, :id, :date, :movie_id
  json.url event_url(event, format: :json)
end
