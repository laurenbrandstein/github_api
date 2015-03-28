require 'rest-client'
require 'json'
require 'pry'

# puts "Want to see all of someone's Github repos?"
# 
# puts "Enter YOUR Github username to make the request:"
# myUsername = gets.strip
# 
# # @TODO: How to obfuscate the pw as typed into the command line?
# puts "Enter YOUR Github password to make the request. Type carefully!"
# myPassword = gets.strip
# 
# puts "Enter the Github username of the user whose repos you would like to investigate:"
# subjectUsername = gets.strip


# Identify yourself to avoid throwing up red flags/API limit issues,
# and get JSON for all of user/<username>'s repos, stored as "response".
url = "https://laurenbrandstein:PASSWORD@api.github.com/users/laurenbrandstein/repos"
response = RestClient.get(url)

# Parse that JSON
parsed_response = JSON.parse(response)

# Uncomment to debug with pry
# binding.pry

# Create an array of just the repo URLs from the response
urls = parsed_response.map { |repo| repo["html_url"] }

# Magically open all the URLs in the default browser
urls.each { |url| system("open #{url}") }
