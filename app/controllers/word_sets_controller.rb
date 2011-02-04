class WordSetsController < ApplicationController

  def destroy
    word_set = WordSet.destroy(params[:id])
    redirect_to user_root_path
  end


  def update
    @user = User.find(params[:user_id])

    if params[:word_set][:comment]
      @word_set = WordSet.find(:first, :conditions => ['receiver_id = ? AND id = ?', @user.id, params[:id]])
      @word_set.comments.create(:title => "", :comment => params[:word_set][:comment], :user_id => current_user.id)

      #mail an den owner des word sets wenn comment von 

      UserMailer.new_comment_on_your_word_set(@word_set).deliver if @word_set.sender && (@word_set.sender != current_user)

      redirect_to show_user_path(@user.username)
    end
  end

  
  def create
    @user = User.find(params[:user_id])
    
    if params[:word_set][:words]
      @user.word_sets.create_set(params[:word_set][:words], params[:user][:note], (current_user ? current_user.id : nil ))
      session[:user][:described_users].push(@user.username)
      UserMailer.new_word_set(@user).deliver


      if current_user && current_user.auth_type == "facebook"
        fb_user = FbGraph::User.me(current_user.last_access_token).fetch
        fb_user.feed!(
          :message => I18n.t("facebook.wall_post_after_giving_words.message", :sender => current_user.username, :receiver => @user.username, :words => params[:word_set][:words].inject([]){|words,hash| words << hash[1]}.join(",")),
          :picture => HOST + current_user.avatar.url(:medium),
          :link => HOST + current_user.username,
          :name => I18n.t("facebook.wall_post_after_giving_words.name"),
          :description => I18n.t("facebook.wall_post_after_giving_words.description")
        )        
      end


      # if @user.auth_type == "facebook"
      #   fb_user = FbGraph::User.me(@user.last_access_token).fetch
      #   fb_user.feed!(
      #     :message => I18n.t("facebook.wall_post_for_receiver_after_receiving_words.message", :sender => (current_user ? current_user.username : "Anónimo"), :receiver => @user.username, :words => params[:word_set][:words].inject([]){|words,hash| words << hash[1]}.join(",")),
      #     :picture => HOST + @user.avatar.url(:medium),
      #     :link => HOST + @user.username,
      #     :name => I18n.t("facebook.wall_post_for_receiver_after_receiving_words.name"),
      #     :description => I18n.t("facebook.wall_post_for_receiver_after_receiving_words.description")
      #   )        
      # end




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
