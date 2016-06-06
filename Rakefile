# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :cms do
  desc "MICS CMS with default settings"
  task bootstrap: :environment do
    Page.create! title: "Demo page", body: "Hello!", slug: "mics"
    Setting.create! key: "homepage", value: "/mics"
    Setting.create! key: "theme", value: "default"
  end
end
