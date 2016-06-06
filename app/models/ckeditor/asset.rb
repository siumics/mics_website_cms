class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/images/gal_del.png )
  delegate :url, :current_path, :content_type, :to => :data

  validates_presence_of :data
end
