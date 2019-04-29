# BASIC CRYPTOGRAPHY
# A string has been passed through three separate encryptions in the following order: Original -> Base64 -> AES-256 -> Blowfish (Keyless) -> Final.
# Write a method that takes this triple encoded string mystery_string = "OXbVgH7UriGqmRZcqOXUOvJt8Q4JKn5MwD1XP8bg9yHwhssYAKfWE+AMpr25HruA"
# and fully unencrypts it to its original state.
# The method should output the fully decoded string to the console.
# Add the answer as a commented line at the end of your file.

# mystery_string = "OXbVgH7UriGqmRZcqOXUOvJt8Q4JKn5MwD1XP8bg9yHwhssYAKfWE+AMpr25HruA"
# aes256_str = "M2yF9+kNzRnl+KQkm3DrQVBZ1WNyeUDFtqx0H8bz35E="
# base64_str = "SSA8MyBSdWJ5IQ=="
# plain_text = "I <3 Ruby!"

require 'base64'
require 'mechanize'

def decrypt(data, link)
    agent = Mechanize.new
    page = agent.get(link)
    form = page.forms.first
    decrypt_input = form.field_with(:name => "encryption[destinationText]").value = data
    
    decrypt_btn = form.button_with(:name => "encryption[decrypt]") #=> decrypt button
    new_form = agent.submit(form, decrypt_btn)

    return decryption_val = new_form.forms.first.field_with(:name => "encryption[sourceText]").value #=> grab data from new form
end

def triple_decrypt(data)
    bfish = "https://encode-decode.com/blowfish-encrypt-online/"
    aes256 = "https://encode-decode.com/aes256-encrypt-online/"

    str = data
    3.times do |idx|
        if idx == 0
            str = decrypt(str, bfish)
        elsif idx == 1
            str = decrypt(str, aes256)
        else
            str = Base64.decode64(str)
        end
    end

    return str
end
    
mystery_string = "OXbVgH7UriGqmRZcqOXUOvJt8Q4JKn5MwD1XP8bg9yHwhssYAKfWE+AMpr25HruA"
puts "Given mystery string: " + mystery_string
puts "Decoded/decrypted string: " + triple_decrypt(mystery_string)

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`"

# Another example
mystery_string2 = "s4U+IOsXWbWT0ebt8e8rkS1VQrYxIGDdKB8BbeRnBsMAd9ONbnZUtRQ2CS8f+gwL"
puts "Given mystery string: " + mystery_string2
puts "Decoded/decrypted string: " + triple_decrypt(mystery_string2)

# Comments:
# Looked up and read different libraries & documenation in Ruby but I couldn't find a way to decrypt aes256 // blowfish without a given key
# What I did find however is a website that can decrypt it
# Decided to use Mechanize (Ruby gem for web interaction), and utilized the site to decrypt it