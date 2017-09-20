json.extract! review, :id, :name, :book_id, :created_at, :updated_at
json.url review_url(review, format: :json)
