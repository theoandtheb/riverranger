json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :username, :email, :crypted_password, :salt
  json.url user_url(user, format: :json)
end
