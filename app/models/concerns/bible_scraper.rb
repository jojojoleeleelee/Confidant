require 'open-uri'
require 'nokogiri'

class BibleScraper
  attr_accessor :verse
  @verses = []

  def self.all_verses
    @verses
  end

  def self.scrape_verse
    url = "https://www.biblegateway.com/quicksearch/?quicksearch=hope&qs_version=NIV"
    doc = Nokogiri::HTML(open(url))
  end
end
