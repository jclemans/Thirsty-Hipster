require 'spec_helper'

describe Location do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :start_time }
  it { should validate_presence_of :end_time }
  it { should have_many :comments }
  it { should have_many :users }

  it 'formats time into a human friendly format' do
    location = Location.create(name: "Bob's Burgers", start_time: "16:00", end_time: "18:00")
    location.hh_start_time.should eq "from 04:00PM"
    location.hh_end_time.should eq "to 06:00PM"
  end
end
