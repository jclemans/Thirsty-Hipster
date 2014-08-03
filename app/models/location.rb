class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time

  has_many :comments
  has_many :users, through: :comments

  before_create :search_yelp

  def hh_start_time
    self.start_time.strftime("from %I:%M%p")
  end

  def hh_end_time
    self.end_time.strftime("to %I:%M%p")
  end

  private

  def search_yelp
    location = self.address + " " + self.city + ", " + self.state
    response = RestClient::Request.new(
      :method => :get,
      :url => "http://api.yelp.com/v2/search?term=#{self.name}&location=#{location}"
      )
  end

end


