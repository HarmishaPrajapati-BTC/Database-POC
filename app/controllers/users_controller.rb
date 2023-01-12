class UsersController < ApplicationController
  def index
    @users = User.all
    begin
      user = User.create(name: 'NEW')
      @msg = "#{user.name} User created"
    rescue ActiveRecord::StatementInvalid => e
      @msg = e.message
    end
  end
end
