require 'rest-client'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated?page=2'

request = RestClient.get url
response = JSON.parse(request)['results'].first(5)

response.each do |movie|
  m = Movie.new(title: movie['title'],
                overview: movie['overview'],
                rating: movie['vote_average'],
                poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}")
  m.save
end
