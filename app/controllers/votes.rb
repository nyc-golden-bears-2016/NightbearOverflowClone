

post '/:question_id/upvote' do
  @question = Question.find(params[:question_id])
  if logged_in?
    vote = Vote.create(votable_id:params[:question_id],votable_type:"Question", user_id: current_user.id, value:1)
    @question.total_votes += 1
    @question.save

  end
  redirect "/questions/#{@question.id}"
end

post '/:question_id/downvote' do
  @question = Question.find(params[:question_id])
  if logged_in?
    vote = Vote.create(user_id: current_user.id, votable_id:params[:question_id], votable_type:"Question", value:-1)
    @question.total_votes -= 1
    @question.save
  end
  redirect "/questions/#{@question.id}"
end

post '/answers/:answer_id/upvote' do
  @answer=Answer.find(params[:answer_id])
  @question = @answer.question
  if logged_in?
    vote = Vote.create(votable_id:@answer.id,votable_type:"Answer", user_id: current_user.id, value:1)
    @answer.total_votes += 1
    @answer.save    
  end
  redirect "/questions/#{@question.id}"
end

post '/answers/:answer_id/downvote' do
  @answer=Answer.find(params[:answer_id])
  @question = @answer.question
  if logged_in?
    vote = Vote.create(user_id: current_user.id, votable_id:@answer.id, votable_type:"Answer", value:-1)
    @answer.total_votes -= 1
    @answer.save      
  end
  redirect "/questions/#{@question.id}"
end