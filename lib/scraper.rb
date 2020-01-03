require 'nokogiri'
require 'open-uri'


# require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
      index_page = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

      students = []

      index_page.css("li.project.grid_4").each do |card|
        card.css(".student-cart a").each do |student|
          student_name => student.css(".student-name").text,
          student_location => student.css(".student-location").text,
          student_profile_link = "#{student.attr('href')}",
          students << {name: student_name, location: student_location, profile_url: student_profile_link}
      }
    end
    end
    students
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
