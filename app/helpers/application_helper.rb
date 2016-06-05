module ApplicationHelper
  def url_for_page page
    (page.slug.present?) ? "/#{page.slug}" : "/pages/#{page.id}"
  end

  def url_for_menu_item menu_item
    (menu_item.url.match /:\/\//) ? menu_item.url : (root_path + menu_item.url)
  end
end
