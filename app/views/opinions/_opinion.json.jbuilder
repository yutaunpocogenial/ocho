json.extract! opinion, :id, :title, :url, :content, :created_at, :updated_at
json.url opinion_url(opinion, format: :json)
