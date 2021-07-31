json.extract! curriculum, :id, :math, :english, :science, :total_score, :average_score, :grade, :remarks, :created_at, :updated_at
json.url curriculum_url(curriculum, format: :json)
