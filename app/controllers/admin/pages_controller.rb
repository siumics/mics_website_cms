module Admin
  class PagesController < AdminController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
      @pages = Page.all
    end

    def show
    end

    def new
      @page = Page.new(type: Type.where(name: params[:type]).first)
      if !@page.type.nil?
        @page.type.field_definitions.each do |defin|
          @page.fields.build(field_definition: defin)
        end
      end
    end

    def edit
    end

    def create
      @page = Page.new(page_params)
      if @page.save
        Rails.application.reload_routes!
        redirect_to admin_page_path(@page), notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    def update
      if @page.update(page_params)
        Rails.application.reload_routes!
        redirect_to admin_page_path(@page), notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      if @page.destroy
        redirect_to admin_pages_url, notice: 'Page was successfully destroyed.'
      else
        redirect_to admin_pages_url, alert: 'Page was not successfully destroyed'
      end
    end

    private
      def set_page
        @page = Page.find(params[:id])
      end

      def page_params
        params.require(:page).permit(:title, :body, :slug, :category_id, :type_id, fields_attributes: [:id, :field_definition_id, :value])
      end
    end
end
