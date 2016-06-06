module Admin::SettingsHelper
  def homepage_options
    grouped_options_for_select({
      "Pages" => Page.all.map { |page| [ page.title, url_for_page(page) ] },
      "Categories" => Category.all.map { |cat| [ cat.name, url_for_category(cat) ] }
      }, Setting.where(key: "homepage").first.value)
  end

  def theme_options
    options_for_select(
      @themes.map { |theme| [ "#{theme.name} (by #{theme.author})", theme.id] },
      Setting.where(key: "theme").first.value
    )
  end
end
