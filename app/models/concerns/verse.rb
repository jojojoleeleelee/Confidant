require 'open-uri'
require 'nokogiri'

class Verse < ActiveRecord::Base
  belongs_to :emotion
  attr_accessor :verse
  @verses = []

  def all_verses
    @verses
  end

  def scrape_verse
    url = "https://www.biblegateway.com/quicksearch/?quicksearch=hope&qs_version=NIV"
    doc = Nokogiri::HTML(open(url))
  end
end
