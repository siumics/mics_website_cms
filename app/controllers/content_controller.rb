class ContentController < ApplicationController
  before_filter :set_theme
  before_filter :get_menu

  def set_theme
    theme = Setting.where(key: "theme").first.value
    prepend_view_path "app/themes/#{theme}"
    self.class.layout "../../themes/#{theme}/layouts"
  end

  def get_menu
    @menus = Menu.all
  end
end
