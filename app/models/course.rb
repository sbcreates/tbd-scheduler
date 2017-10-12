class Course < ApplicationRecord
  belongs_to :user

  def self.search(course)
    courses = []
    response = HTTParty.get("http://localhost:4242/1.0/courses/filter?q=name:'#{course} OR +code:'#{course}&limit=100")
    parsed_reponse = JSON.parse(response.body)
    parsed_reponse.each do |course|
      courses << {
        name: course['name'],
        code: course['code'],
        description: course['description']
      }
    end
    return courses
  end




end
