post '/searches' do
  search_query = params[:search].downcase.split(//)
  @search = []
  search_query.each do |word|
    @search += Question.where('title LIKE ?', "%#{word}%")
    @search += Question.where('body LIKE ?', "%#{word}%")
  end
  @search.uniq!.sort_by! { |x| x.answers.length }
  @search_results = @search.reverse.take(10)
  erb :'/searches/new'
end
