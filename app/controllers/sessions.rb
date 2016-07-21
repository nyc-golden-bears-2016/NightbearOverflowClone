get '/sessions/login' do
	erb :'sessions/login'
end

post '/sessions/login' do 
	@user = User.find_by(username: params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id 
			redirect '/'
		else
			@error = "Email/Password incorrect"
			erb :'/sessions/login'
		end
	end

get '/sessions/logout' do 
	session.clear
	redirect '/'
end

