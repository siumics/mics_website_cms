class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :url
      t.string :title
      t.references :menu

      t.timestamps null: false
    end
  end
end
