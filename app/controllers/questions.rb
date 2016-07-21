get '/questions' do
  @questions = Question.all.order(created_at: :desc)
  if logged_in?
    @user = User.find(session[:user_id])
  end
  erb :'questions/index'
end

get '/questions/new' do
  @errors = ["You will need to login in order to post this question."] unless logged_in?
  erb :'questions/new'
end

post '/questions' do
  halt(401, "Please login to ask questions.") unless logged_in?
  question = Question.new(params[:question].merge(user: current_user))
  if question.save
    question.create_tags_and_associations(params[:tags])
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  num = @question.total_views += 1
  @question.update_attributes(total_views: num)
  @comments = @question.comments
  @answers = @question.answers
  @tags = @question.tags
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  @user = @question.user
  @tags = @question.tag_list
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @user
  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @user = @question.user
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @user
  @question.update_attributes(params[:question].merge(edited_at: DateTime.now))
  if @question.save
    @question.update_tags_and_associations(params[:tags])
    erb :"questions/#{@question.id}"
  else
    @errors = question.errors.full_messages
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @user = @question.user
  halt(401, "You do not have permission to complete this action.") unless logged_in? && current_user == @user
  @question.destroy
  erb :'questions/index'
end
