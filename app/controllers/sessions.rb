get '/sessions/login' do
	erb :'users/login'
end

post 'sessions/login' do 
	@user = User.find_by(username: params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id 
			redirect '/'
		else
			@error = "Email/Password incorrect"
			erb :'/users/login'
		end
	end

get '/sessions/logout' do 
	session.clear
	redirect '/'
end

