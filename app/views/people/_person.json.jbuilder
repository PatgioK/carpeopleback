json.extract! person, :id, :firstname, :lastname, :email, :created_at, :updated_at
json.url person_url(person, format: :json)
