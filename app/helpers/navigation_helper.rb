module NavigationHelper
  
  def navigation_menu
    items = ''
    navigation_items.each do |item|
      items << content_tag(:li, link_to(item[:text], item[:link])).html_safe
    end
    content_tag(:ul, items.html_safe)
  end
  
  private
  def navigation_items
    [
      {:text => 'Vote en cours', :link => ongoing_polls_path},
      {:text => 'Prochain vote', :link => upcoming_polls_path},
      {:text => 'Archives', :link => nil}
    ]
  end
end