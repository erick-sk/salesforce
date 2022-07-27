require 'faraday'

class User < ApplicationRecord
  # Callbacks
  before_validation :add_attributes

  # Validates
  validates :name_first, :name_last, :dob_age, :gender, :email, :nat, :picture_thumbnail, presence: true

  private

    # Add attributes
    def add_attributes
      data = get_user
      self.name_first = data.dig("name", "first")
      self.name_last = data.dig("name", "last")
      self.dob_age = data.dig("dob", "age")
      self.gender = data.dig("gender")
      self.nat = data.dig("nat")
      self.email = data.dig("email")
      self.picture_thumbnail = data.dig("picture", "thumbnail")
    end

    # Get users
    def get_user
      response = Faraday.get("https://randomuser.me/api/")

      raise StandardError.new "User not found" unless response.status == 200
      JSON.parse(response.body)["results"][0]
    end
end
