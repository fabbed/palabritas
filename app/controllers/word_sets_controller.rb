class WordSetsController < ApplicationController

  def destroy
    word_set = WordSet.destroy(params[:id])
    redirect_to user_root_path
  end


  def create
    @user = User.find(params[:user_id])
    
    if params[:word_set][:words]
      @user.word_sets.create_set(params[:word_set][:words], params[:user][:note], (current_user ? current_user.id : nil ))
      
      session[:user][:described_users].push(@user.username)
      
      if current_user
        flash[:promote] = I18n.t("words_sent")
        redirect_to show_user_path(User.find(params[:user_id]).username, :t => "word_set_created")
      else
        flash[:promote] = I18n.t("promote_flash_after_words_were_sent")
        redirect_to root_path(:t => "word_set_created")
      end
      
    end

  end


end
