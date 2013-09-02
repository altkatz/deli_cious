class AddFieldsToCrawlSites < ActiveRecord::Migration
  def change
    add_column :crawled_sites, :rules, :text
  end

end
