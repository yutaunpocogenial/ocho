json.extract! comment, :id, :name, :content, :opinion/id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
