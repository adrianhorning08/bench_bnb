class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render json: 200
    else
      # flash[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end




# $.ajax({
#     url: 'api/users',
#     method: 'POST',
#     data: {user: {username: 'ashil', password: 'cohortz'}}
# })

# $.ajax({
#     url: 'api/session',
#     method: 'POST',
#     data: {user: {username: 'adrian1', password: 'cohortz'}}
# })
#
# $.ajax({
#     url: 'api/session',
#     method: 'DELETE',
#     data: {user: {username: 'adrian1', password: 'cohortz'}}
# })
