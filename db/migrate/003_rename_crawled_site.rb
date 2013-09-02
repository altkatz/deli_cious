class RenameCrawledSite < ActiveRecord::Migration
  def change
    rename_table :crawled_sites, :crawled_site
  end
end
