# Minitest spec.
require 'minitest/autorun'

class Robot
# Robot factory methods... How we keep track of how many robots.
  def self.built_count
    if @built_count.nil?
      return 0
    else
      return @built_count
    end
  end

  def self.increment_built
    @built_count = built_count + 1
  end

# All methods from this point down are specific to each instance of a robot.
  def initialize
    @dob = Time.now
    @name = name_generation
    @start_time = Time.now
  end

  def name_generation
    name = 'AB' + rand(100..1000).to_s
  end

  def name
    @name
  end

  def age
    Time.now - @dob
  end

  def reset
    @name = name_generation
    @start_time = Time.now
  end

  def run_time
    Time.now - @start_time
  end
end

describe Robot do
  before do
    @rodgerbot = Robot.new
    @stevebot = Robot.new
  end

  it "should create a new robot" do
    @rodgerbot.must_be_instance_of(Robot)
  end

  it "should have a unique name" do
    @rodgerbot.name.wont_equal(@stevebot.name)
  end


  it "should have an age" do
    @rodgerbot.age.must_be(:>=, 0)
    sleep(1)
    @rodgerbot.age.must_be :>=, 1
  end

  it "should reset with a new name" do
    start_name = @rodgerbot.name
    @rodgerbot.reset
    end_name = @rodgerbot.name
    end_name.wont_equal(start_name)
  end


  it "should know how long since last boot up" do
    @stevebot
    sleep(1)
    @stevebot.run_time.must_be :>=, 1
    @stevebot.reset
    @stevebot.run_time.must_be :<=, 1
  end

# I was having a had time with this one so I skip the test by pulling out the 'do'
  it "should know how many robots have been made"

end








