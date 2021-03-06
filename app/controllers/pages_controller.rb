class PagesController < ContentController
  def show
    @page = Page.find(params[:id])
    render template: template_to_render
  end

  protected

  def template_to_render
    if(!@page.type.nil? && template_exists?("page-#{@page.type.name}"))
      "page-#{@page.type.name}"
    else
      "page"
    end
  end
end
