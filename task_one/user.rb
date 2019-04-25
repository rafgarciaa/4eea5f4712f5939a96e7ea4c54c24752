# API ENDPOINTS
# Write a method named users that takes a single optional argument and makes a HTTP GET request to https://reqres.in/api/users.
# If an id is provided as an argument, only retrieve the record with the matching ID. Otherwise, retrieve all records.
# If an invalid argument is provided, assume all records are desired.
# Once you have the JSON, convert and write it to a YAML file called users.yml.
# Make sure to include an example YAML file with your commit.

require 'faraday'
require 'psych'
require 'json'

def users(id=nil)
  url = "https://reqres.in/api/users"
  response = Faraday.get(url)
  response_body = JSON.parse(response.body)
  users = response_body["data"]

  if id != nil
    users.each do |user|
      if id == user["id"]
        return File.open("users.yml", "w") { |file| file.write(user.to_yaml) }
      end
    end
  end

  File.open("users.yml", "w") { |file| file.write(users.to_yaml) }
end

users