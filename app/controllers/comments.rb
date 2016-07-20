get '/comments/new' do
	erb :'comments/new'
end

post '/comments' do
	@comment = Comment.new(params[:comment])
	if @comment.save
		@question = Comment.question
		redirect "/questions/#{@question.id}"
	else
		@errors = @comment.errors.full_messages
		erb :'comments/new'
	end
end

get '/comments/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'comments/edit'
end

put '/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.update(params[:comment])

end

delete '/comments/:id' do
	redirect "/questions/#{}"
end