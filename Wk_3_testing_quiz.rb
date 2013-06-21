# I utilized the framework of the Robot.reset exercise.
# I did not write all of this code explicitly during the test time.
# Just so there was no confusion.

# Minitest spec included @ bottom.
require 'minitest/spec'
require 'minitest/autorun'

#if I were to tie in a seperate testing only file all that would be required is.
#require '__filepath__'


class Robot
# Robot factory methods... How we keep track of how many robots.
  def self.____
    # I have started separating class & instance methods for easier understanding.
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
# 'exercising' the code
  before do
    @rodgerbot = Robot.new
    @stevebot = Robot.new
  end

# Leave out the 'do' and minitest spec automatically skips.
  it "should skip this test"

  it "should create a new robot" do
    @rodgerbot.must_be_instance_of(Robot)
  end

  it "should have a unique name" do
    @rodgerbot.name.wont_equal(@stevebot.name)
   # puts @rodgerbot.name
   # puts @stevebot.name
  end

  it "should have an age" do
    @rodgerbot.age.must_be(:>=, 0)
   # puts @rodgerbot.age
    sleep(1)
    @rodgerbot.age.must_be :>=, 1
   # puts @rodgerbot.age
  end

  it "should reset with a new name" do
    start_name = @rodgerbot.name
    # puts @rodgerbot.name
    @rodgerbot.reset
    end_name = @rodgerbot.name
    # puts @rodgerbot.name
    end_name.wont_equal(start_name)
  end

  it "should know how long since last boot up" do
    @stevebot
    sleep(2)
    @stevebot.run_time.must_be :>=, 2
    # puts @stevebot.run_time
    @stevebot.reset
    @stevebot.run_time.must_be :<=, 1
    # puts @stevebot.run_time
  end

  it "should know how many robots have been made"
# this will tie into the class methods in order to count number of Robot.new instances that have occured.

end








