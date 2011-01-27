module ApplicationHelper

  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output
  end

  def fb_text
    "Describe " + current_user.username.gsub(/\'/,"")
  end

  def render_avatar(user, size = "medium")
    if user && user.avatar.exists?
      output=image_tag(user.avatar.url(:medium)) if size == "medium"
      output=image_tag(user.avatar.url(:thumb)) if size == "thumb"
    else
      output=image_tag("missing_100_100.png") if size == "medium"
      output=image_tag("missing_50_50.png") if size == "thumb"
    end
    
    content_tag(:div, output, :class => "#{size}_avatar")
  end

  def render_flash_in_section_head
    output = ""
    output << content_tag(:div, flash[:notice], :class => "flash_in_section_head notice") if flash[:notice]
    output << content_tag(:div, flash[:error], :class => "flash_in_section_head error") if flash[:error]
    output
  end
  
  
  def set_sender_name(set)
    return "Anonimo" unless set.sender_id
    return link_to(set.sender.display_name, show_user_path(set.sender.username))
  end


  def set_words(set)
    output = ""
    set.words.each_with_index do |word, i|
      if i < set.words.size-1
        output << word.word + ", "
      else
        output << "<span class='normal'>y</span> " + word.word
      end
    end

    return output
  end


end
