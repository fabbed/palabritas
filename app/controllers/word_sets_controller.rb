class WordSetsController < ApplicationController

  def destroy
    word_set = WordSet.destroy(params[:id])
    redirect_to user_root_path
  end


  def create
    @user = User.find(params[:user_id])
    
    if params[:word_set][:words]
      @user.word_sets.create_set(params[:word_set][:words], params[:user][:note], current_user.id)
      flash[:message] = "TODO"
      redirect_to show_user_path(User.find(params[:user_id]).username)
    end

  end


end
