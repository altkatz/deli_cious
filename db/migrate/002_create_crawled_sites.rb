class CreateCrawledSites < ActiveRecord::Migration
  def self.up
    create_table :crawled_sites do |t|
      t.string :url
      t.datetime :last_crawled
      t.datetime :crawlable
      t.integer :interval
      t.timestamps
    end
  end

  def self.down
    drop_table :crawled_sites
  end
end
