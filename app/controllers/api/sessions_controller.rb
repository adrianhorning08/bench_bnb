class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      debugger
      login(@user)
      render json: {status: 'Success!'}
    else
      # fix this
      flash[:errors] = ['Invalid credentials']
    end
  end

  def destroy
    if current_user
      logout
      render json: {}
    else
      render json: 'No one logged in', status: 404
    end
  end
end
