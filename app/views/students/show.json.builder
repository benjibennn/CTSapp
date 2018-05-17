json.array!(@subjects) do |x|
  json.extract! x, :id, :subject_name
  json.start x.start_time
  json.end x.end_time
  json.url students_show_url(x, format: :html)
end