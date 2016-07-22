get '/questions/:id/comments/new' do
   @question = Question.find(params[:id])
  if request.xhr?
  erb :'/comments/new', layout: false
else
   erb :'/comments/new'
end
end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
 if request.xhr?
  erb :'/comments/new', layout: false
else
  erb :'/comments/new'
  end
end

post '/questions/:id/comments' do
    @question = Question.find(params[:id])
    @comment = @question.comments.new(body:params[:content],user_id:current_user.id)
    if @comment.save
      redirect "questions/#{@question.id}"
    else
      @errors = @comment.errors.full_messages
      erb :'/comments/new'
    end
end

post '/answers/:id/comments' do
    @answer = Answer.find(params[:id])
    @comment = @answer.comments.new(body:params[:content],user_id:current_user.id)
    if @comment.save
      redirect "questions/#{@answer.question_id}"
    else
      @errors = @comment.errors.full_messages
      erb :'/comments/new'
    end
end
