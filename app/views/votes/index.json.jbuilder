json.array!(@votes) do |vote|
  json.extract! vote, :id, :event_id, :closed
  json.url vote_url(vote, format: :json)
end
