# -*- coding: utf-8 -*-
require 'json'
task :crawl => :environment do
  site = CrawledSite.first
  url = site[:url]
  rules = JSON.parse site[:rules]
  CrawlWorker.perform_async(url, rules)
end
