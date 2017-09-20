require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @word_list = Word.sort()
  erb(:list)
end

get('/word/:id') do
  @word = Word.find(params[:id])
  erb(:word_page)
end

post('/') do
  word = params["word"]
  word_info = {"word" => word}
  new_word = Word.new(word_info)
  new_word.add_word()
  redirect "/"
end

post('/word/:id') do
  word = Word.find(params[:id])
  definition = params["definition"]
  word.add_def(definition)
  redirect "word/#{params[:id]}"
end
