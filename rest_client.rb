# Do a Bing and YouTube search with RestClient
# and save the responses in variables.
require 'rest-client'

bing = 'https://www.bing.com/'
youtube = 'https://www.youtube.com/'

no_search_bing = RestClient.get bing
no_search_youtube = RestClient.get youtube

puts "The YouTube index page returns code #{no_search_bing.code}"
puts "The Bing index page returns headers: #{no_search_bing.headers}"
puts

# The next line includes the unfinished query string.
youtube_search_path = 'results?search_query='
puts 'What videos do you want to look for?'
search = gets.chomp

youtube_query = RestClient.get(youtube + youtube_search_path + search)

puts "Your YouTube search response has code #{youtube_query.code}"
puts "Your YouTube search response has headers: #{youtube_query.headers}"
puts "Your YouTube search response has cookies #{youtube_query.cookies}"
puts

# We can also use RestClient.get with a second argument
# for the query string itself.
bing_search_path = 'search?'
puts 'What do you want to search for in Bing?'
search = gets.chomp

bing_query = RestClient.get(bing + bing_search_path, params: { q: "#{search}"})

puts "Your Bing search response has code #{bing_query.code}"
puts "Your Bing search response has headers: #{bing_query.headers}"
puts "Your Bing search response has cookies: #{bing_query.cookies}"
