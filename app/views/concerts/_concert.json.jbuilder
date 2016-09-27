json.extract! concert, :id, :title, :start, :end, :artist, :city, :state, :created_at, :updated_at
json.url concert_url(concert, format: :json)