get '/comments/question' do
  @question = Question.find(params[:question_id])
  erb :'/comments/new'
end

get '/comments/answer' do
  @answer = Answer.find(params[:answer_id])
  erb :'/comments/new'
end

post '/comments/question' do
    @question = Question.find(params[:question_id])
    @comment = @post.comments.new(content:params[:content],user_id:current_user.id)
    if @comment.save
    	@comment.question_id = @question.id
    	@comment.save
      redirect "questions/#{@question.id}"
    else
      @errors = post.errors.full_messages
      erb :'/comments/new'
    end
end

post '/comments/answer' do
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(content:params[:content],user_id:current_user.id)
    if @comment.save
    	@comment.answer_id = @answer.id
    	@comment.save
      redirect "questions/#{@answer.question_id}"
    else
      @errors = post.errors.full_messages
      erb :'/comments/new'
    end
end
