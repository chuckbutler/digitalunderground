json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :slurl, :description, :genres, :radio, :partner_program, :photo, :facebook
  json.url venue_url(venue, format: :json)
end
