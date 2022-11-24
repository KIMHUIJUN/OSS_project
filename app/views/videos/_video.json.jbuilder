json.extract! video, :id, :src, :intro, :track_id, :created_at, :updated_at
json.url video_url(video, format: :json)
