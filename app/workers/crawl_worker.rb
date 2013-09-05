require 'nokogiri'
require 'open-uri'

class CrawlWorker
  include Sidekiq::Worker

  def perform(url, rules)
    img_rule = rules['children']['img']
    title_rule = rules['children']['title']
    puts "here"
    parents = Nokogiri::HTML(open(url)).css(rules['parents'])

    parents.each do |parent|
      Recipe.create(
                    img_src: parent.css(img_rule)[0]['src'],
                    title: parent.css(title_rule)[0].content,
                    recipe_url: parent.css(title_rule)[0]['href']
                    )
    end

  end

end
