post '/searches' do
  @search_query = params[:search].split
  @search_results = Question.search(@search_query)
  @questions = Question.all.where.not(words_that_match: 0).order(words_that_match: :desc).limit(10)
  erb :'/searches/new'
end