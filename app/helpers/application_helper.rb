module ApplicationHelper
  def full_title(page_title)
    base_title = "Jhupro"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def activeMenu(action, current_link)
    home_menu = "home"
    if action.empty?
      home_menu
    else
      if action==current_link
        'active'
      end
    end
  end
end
