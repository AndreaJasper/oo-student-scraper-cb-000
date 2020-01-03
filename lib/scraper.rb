require 'nokogiri'
require 'open-uri'
require 'pry'

# require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
      Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

      binding.pry

      students = {}

      kickstarter.css("li.project.grid_4").each do |student|
      name = student.css(".student-cart.card-text-container h4.student-name").text
      students[name.to_sym] = {
        :location => student.css(".student-cart.card-text-container p.student-location").text,
        :profile_url => student.css(".student-card a").text
      }
    end
      profile_url

  end

  def self.scrape_profile_page(profile_url)
  #  Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

  #  kickstarter.css("li.project.grid_4").each do |student|
  #  title = student.css("h2.bbcard_name strong a").text
  #  student[title.to_sym] = {
  #    :twitter => student.css("div.project-thumbnail a img").attribute("src").value,
  #    :linkedin => student.css("p.bbcard_blurb").text,
  #    :github => student.css("span.location-name").text,
  #    :blog =>
  #    :profile_quote =>
  #    :bio =>
  #  }
  #  end
  #  profile_url
  end
end

scrape_index_page
