json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :level, :duration, :format
  json.url course_url(course, format: :json)
end
