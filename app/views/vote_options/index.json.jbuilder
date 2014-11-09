json.array!(@vote_options) do |vote_option|
  json.extract! vote_option, :id, :vote_id, :movie_id, :count
  json.url vote_option_url(vote_option, format: :json)
end
