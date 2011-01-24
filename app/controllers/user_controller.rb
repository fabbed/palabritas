class UserController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :update, :validate_form_data]

  def show
    @user = User.find_by_username(params[:username])
    @word_set = WordSet.new
  end
  
  def dashboard
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user]) if !params[:user][:words]
    flash[:message] = "TODO"
    redirect_to edit_user_path(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  def validate_form_data
    case params[:user].keys[0]
      when "username"
        if User.find_by_username(params[:user][:username])
          return_value = false
        else
          return_value = true
        end
      when "email"
        if User.find_by_email(params[:user][:email])
          return_value = false
        else
          return_value = true
        end
    end
      
    render :text => return_value
  end

end