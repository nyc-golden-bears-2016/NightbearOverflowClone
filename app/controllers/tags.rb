get '/tags' do
	@tags = Tag.all
	erb :'tags/index'
end

post '/tags' do
	erb :'tags/new'
end

get '/tags/:id' do
	@tag = Tag.find(params[:id])
	erb :'tags/show'
end

get '/tags/:id/edit' do
	@tag = Tag.find(params[:id])
	erb :'tags/edit'
end

put '/tags/:id' do
end

delete '/tags/:id' do
	redirect '/tags'
end

