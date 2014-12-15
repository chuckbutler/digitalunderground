json.array!(@djs) do |dj|
  json.extract! dj, :id, :name, :experience, :location, :genre, :collab, :software, :photo, :soundcloud, :mixcloud, :youtube, :vimeo, :bio
  json.url dj_url(dj, format: :json)
end
