require 'nokogiri'
require 'open-uri'


# require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
      index_url = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

      students = {}

      doc.css("li.project.grid_4").each do |student|
      name = student.css(".student-cart.card-text-container h4.student-name").text
      students[name.to_sym] = {
        :location => student.css(".student-cart.card-text-container p.student-location").text,
        :profile_url => student.css(".student-card a").text
      }
    end
      index_url

  end

  def self.scrape_profile_page(profile_url)
    profile_url = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

    doc.css("div.vitals-container").each do |student|
      student = {
      :twitter => student.css("div.social-icon-container a").text,
      :linkedin => student.css("p.bbcard_blurb").text,
      :github => student.css("span.location-name").text,
      :blog => student.css(""),
      :profile_quote => student.css("div.profile_quote").text,
      :bio => student.css("")
    }
    end
    Scraper.scrape_profile_page(profile_url)
  end
end
