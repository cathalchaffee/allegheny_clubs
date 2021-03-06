module ApplicationHelper
  #make sure there is an appropriate title
  def full_title(page_title = '')
    base_title = "Allegheny Clubs"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def from_controller_action
    "#{controller_name}_#{action_name}"
  end
end
