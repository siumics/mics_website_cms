module ApplicationHelper
  def url_for_page page
    (page.slug.present?) ? "/#{page.slug}" : "/pages/#{page.id}"
  end
end
