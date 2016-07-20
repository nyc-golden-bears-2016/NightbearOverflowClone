get '/comments/post' do
  @post = Post.find(params[:post_id])
  erb :'/comments/new'
end

get '/comments/answer' do
  @answer = Answer.find(params[:answer_id])
  erb :'/comments/new'
end


post '/comments/post' do
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(content:params[:content],user_id:current_user.id)
    if @comment.save
      redirect "posts/#{@post.id}"
    else
      @errors = post.errors.full_messages
      erb :'/comments/new'
    end
end

post '/comments/answer' do

    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(content:params[:content],user_id:current_user.id)
    if @comment.save
      redirect "posts/#{@answer.post_id}"
    else
      @errors = post.errors.full_messages
      erb :'/comments/new'
    end
end