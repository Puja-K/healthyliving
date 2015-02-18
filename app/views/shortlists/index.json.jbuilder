json.array!(@shortlists) do |shortlist|
  json.extract! shortlist, :id, :user_id, :course_id
  json.url shortlist_url(shortlist, format: :json)
end
