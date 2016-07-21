get '/questions/:q_id/answers/new' do
  @question = Question.find(params[:q_id])
  #This is here to make sure user can't go directly to answer
  #question without associated question
  @errors = ["You will need to login in order to answer this question."] unless logged_in?
  erb :'answers/new'
end

post '/questions/:q_id/answers' do
  @question = Question.find(params[:q_id])
  halt(401, "Please login to answer questions.") unless logged_in?
  answer = Answer.new(params[:answer].merge(user: current_user, question_id: params[:q_id]))
  if answer.save
    redirect "questions/#{@question.id}"
  else
    @errors = answer.errors.full_messages
    erb :'answers/new'
  end
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @user = @answer.user
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @user
  erb :'answers/edit'
end

get '/answers/:id/bestanswer' do
  @answer = Answer.find(params[:id])
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @answer.user
  ##Create best answer if question does not have other best answers
  erb :'answers/edit'
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @user = @answer.user
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @user
  @answer.update_attributes(params[:answer].merge(edited_at: DateTime.now))
  if @answer.save
    redirect "questions/#{@question.id}"
  else
    @errors = answer.errors.full_messages
    erb :'answers/edit'
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @user = @answer.user
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @user
  @answer.destroy
  redirect "questions/#{@question.id}"
end
