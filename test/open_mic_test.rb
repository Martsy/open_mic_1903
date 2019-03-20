require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class MicTest < Minitest::Test
  def setup
    @OpenMic.new({location: "Comedy Works", date: "11-20-18"})
  end
end
