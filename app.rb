require('sinatra')
require('sinatra/reloader')
require('./lib/numbers_to_words')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/title') do
  @title = params.fetch('title').to_i.numbers_to_words()
  erb(:title)
end
