json.extract! person, :id, :description, :registration, :birth_date, :birth_county, :marital_status, :sex, :workspace_id, :job_role_id, :created_at, :updated_at
json.url person_url(person, format: :json)
