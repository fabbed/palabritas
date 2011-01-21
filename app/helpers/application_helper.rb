module ApplicationHelper

  def set_sender_name(set)
    return "Anonimo" unless set.sender_id
    return link_to set.sender.display_name, user_path(set.sender)
  end


  def set_words(set)
    output = ""
    set.words.each_with_index do |word, i|
      if i < set.words.size-1
        output << content_tag(:span, word.word + ", ")
      else
        output << content_tag(:span, word.word)
      end
    end

    return output
  end

end
