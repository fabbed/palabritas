class UserController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :update, :validate_form_data]

  def show
    @user = User.find_by_username(params[:username])
    @word_set = WordSet.new
  end
  
  def dashboard
    @fb_user = FbGraph::User.me(current_user.last_access_token) if current_user.is_facebook_user?
    # @fb_user.fetch if @fb_user # TODO
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user]) if !params[:user][:words]
    if @user.valid? && !@user.all_values_valid
      @user.update_attribute(:all_values_valid, true)

      fb_user = FbGraph::User.me(@user.last_access_token).fetch
      fb_user.feed!(
        :message => I18n.t("facebook.wall_post_after_sign_up.message"),
        :picture => HOST + @user.avatar.url(:medium),
        :link => HOST + @user.username,
        :name => I18n.t("facebook.wall_post_after_sign_up.name"),
        :description => I18n.t("facebook.wall_post_after_sign_up.description")
      )


      redirect_to user_root_path
    elsif @user.valid?
      flash[:notice] = "Has actualizado tus datos."
      render :action => :edit
    else
      flash[:error] = "Corrige los errores"      #todo
      render :action => :edit
    end
  end

  def edit
    if params[:id] == current_user.id
      @user = User.find(params[:id]) 
    end
  end

  def share_on_wall
    #Share on Wall
    fb_user = FbGraph::User.me(user.last_access_token).fetch
    fb_user.feed!(
      :message => I18n.t("facebook.wall_post_after_sign_up.message"),
      :picture => HOST + user.avatar.url(:medium),
      :link => HOST + user.username,
      :name => I18n.t("facebook.wall_post_after_sign_up.name"),
      :description => I18n.t("facebook.wall_post_after_sign_up.description")
    )
    #end SHARE ON FACEBOOK
    redirect_to user_root_path
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