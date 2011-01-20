module ApplicationHelper

  def get_set(set_id)
    DescriptionSet.find_by_set_id(set_id)
  end

  def set_sender_name(set_id)
    set = get_set(set_id)
    return "Anonimo" unless set.sender_id
    return link_to set.sender.display_name, user_path(set.sender)
  end


  def set_words(set_id)
    sets = DescriptionSet.find(:all, :conditions => ['set_id = ?', set_id])
    output = ""
    puts set_id
    sets.each do |set|
      output << content_tag(:span, set.word.word+ ", ")
    end

    return output
  end

end
