class RenameCrawledSites < ActiveRecord::Migration
  def change
    rename_table :crawled_site, :crawled_sites
  end
end
