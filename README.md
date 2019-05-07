# Ruby Coding Exercise/Challenge

## Task 1 - API Endpoints
Write a method named users that takes a single optional argument and makes a HTTP GET request to https://reqres.in/api/users. If an id is provided as an argument, only retrieve the record with the matching ID. Otherwise, retrieve all records. If an invalid argument is provided, assume all records are desired. Once you have the JSON, convert and write it to a YAML file called users.yml. Make sure to include an example YAML file with your commit.

## Task 2 - Basic Cryptography
A string has been passed through three separate encryptions in the following order: Original -> Base64 -> AES-256 [no key] -> Blowfish (Keyless) -> Final. Write a method that takes this triple encoded string mystery_string = "OXbVgH7UriGqmRZcqOXUOvJt8Q4JKn5MwD1XP8bg9yHwhssYAKfWE+AMpr25HruA" and fully unencrypts it to its original state. The method should output the fully decoded string to the console. Add the answer as a commented line at the end of your file.

## Task 3 - Unorthodox/Impossible method creation (Advanced level)
Create a method called ultimate.answer which takes no arguments. The method should simply return the number 42. Invoke your method and have it print the result to console.
