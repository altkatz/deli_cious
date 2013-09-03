class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :img_src
      t.string :title
      t.string :recipe_url
      t.text :recipe_content
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
