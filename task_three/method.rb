# Unorthodox/Impossible method creation (Advanced level)
# Create a method called ultimate.answer which takes no arguments.
# The method should simply return the number 42.
# Invoke your method and have it print the result to console.

ultimate = Object.new
def ultimate.answer
    puts 42
    return
end

ultimate.answer #=> 42


# Comments:
# Not really sure if this is the correct solution because I am essentially declaring ultimate to be an object and defining ultimate#answer method onto it.

# Other possible solutions could be using metaprogramming
# or modifying the configuration of defining methods in the Ruby itself.

