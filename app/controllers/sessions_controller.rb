class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  def index

  end

  def new
  end

  def create
   user = User.find_by(email: params[:email])

   if user && user.authenticate(params[:password])
     session[:user_id] = user.id

     redirect_to root_path
   else
     redirect_to new_session_path, danger: 'Invalid email or password'
   end
 end

 def destroy
   session[:user_id] = nil

   redirect_to log_in_path
 end
end
