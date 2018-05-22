json.extract! trip, :id, :title, :description, :date, :user_id, :student_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
