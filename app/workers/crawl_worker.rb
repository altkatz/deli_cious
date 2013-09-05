require 'nokogiri'
require 'open-uri'
# crawl worker using sidekiq as queue, called by crawl.rake
class CrawlWorker
  include Sidekiq::Worker

  def perform(url, rules)
    img_rule = rules['children']['img']
    title_rule = rules['children']['title']
    recipe_rule = rules['recipe']
    root_url = %r{(http:\/\/.*?)\/}.match(url)[1]

    parents = Nokogiri::HTML(open(url)).css(rules['parents'])
    parents.each do |parent|
      recipe_url = root_url + parent.css(title_rule)[0]['href']
      recipe_content = Nokogiri::HTML(open(recipe_url)).css(recipe_rule).to_s
      Recipe.create(
                    img_src: parent.css(img_rule)[0]['src'],
                    title: parent.css(title_rule)[0].content,
                    recipe_url: recipe_url,
                    recipe_content: recipe_content
                    )
      sleep 1
    end

  end

end
