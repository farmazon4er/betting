class UsersController < ApplicationController

  before_action :authenticate_user!, only: :restore_balance

  def restore_balance
    if current_user.balance == 0 
      user = current_user
      user.update(balance: 10000)
      flash[:success] = 'You got 10,000 on your balance!'
    else
      flash[:notice] = 'Your balance is not at zero'
    end
  end
end