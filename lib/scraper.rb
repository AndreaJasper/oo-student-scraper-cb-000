require 'nokogiri'
require 'open-uri'


require_relative './student.rb'

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
    student = {}
    profile_page = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    links = profile_page.css("social-icon-container").children.css("a").map {|el| el.attribute('href').value}

    links.each do |link|
      if link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?("twitter")
        student[:twitter] = link
      else
        student[:blog] = link
      end
    end

    student[:profile_quote] = profile_page.css(".profile-quote").text if profile_page.css(".profile-quote")
    student[:bio] = profile_page.css("div.bio-content.content-holder div.description-holder p").text if profile_page.css("div.bio-content.content-holder div.description-holder p")

    student
  end

end
