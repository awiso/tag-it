module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def navbar_class
    if current_page? walls_path
      return "fixed"
    else
      return ""
    end
  end
end
