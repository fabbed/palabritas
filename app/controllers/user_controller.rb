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
    @user = User.find(params[:id])
  end

  def share_on_wall
    fb_user = FbGraph::User.me(current_user.last_access_token).fetch
    
    fb_user.feed!(
      :message => 'Como me describerias en 5 palabras?',
      :picture => HOST+current_user.avatar.url(:medium),
      :link => HOST + current_user.username,
      :name => '5palabritas.com - Quieres saber que la gente piensa realmente de ti?',
      :description => 'Describe me en 5palabritas.com'
    )
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