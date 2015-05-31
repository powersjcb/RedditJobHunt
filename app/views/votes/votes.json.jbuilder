json.extract! @listing, :id
json.listing do
  json.vote_count @vote_count
end
