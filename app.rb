require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do #home page
  @word_list = Word.sort()
  erb(:list) #render list template, which shows word list
end

get('/word/:id') do #show selected word
  @word = Word.find(params[:id])
  erb(:word_page)
end

post('/') do #add word to list, show alphabetized list
  word = params["word"]
  word_info = {"word" => word}
  new_word = Word.new(word_info)
  new_word.add_word()
  redirect "/"
end

post('/word/:id') do
  word = Word.find(params[:id])
  definition = params["definition"]
  word.add_definition(definition)
  redirect "/word/#{params[:id]}"
end
