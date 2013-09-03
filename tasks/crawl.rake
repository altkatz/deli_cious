# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'json'
task :crawl => :environment do
  site = CrawledSite.first
  crawl_site site
end

def crawl_site site
  url = site[:url]
  rules = JSON.parse site[:rules]
  img_rule = rules["children"]["img"]
  title_rule = rules["children"]["title"]

  parents = Nokogiri::HTML(open(url)).css(rules["parents"])

  parents.each do |parent|
    parent.css(img_rule)[0]["src"]
    parent.css(title_rule)[0].content
    parent.css(title_rule)[0]["href"]
  end
end
