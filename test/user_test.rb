require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def setup
    @sal = User.new('Sal')
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')
    @joke_2 = Joke.new(2, 'How do you keep a lion from charging?', 'Take away its credit cards.')
  end

  def test_user_class_exists
    assert_instance_of User, @sal
  end

  def test_user_has_a_name
    assert_equal 'Sal', @sal.name
  end

  def test_user_starts_with_an_empty_array_of_jokes
    assert_equal [], @sal.jokes
  end

  def test_each_joke_is_added_to_jokes_array
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)
    assert_equal [@joke_1, @joke_2], @sal.jokes
  end

  def test_new_user_ali_has_been_added_to_user_class
    assert_instance_of User, @ali
  end

  def test_new_user_has_a_name
    assert_equal 'Ali', @ali.name
  end

  def test_sal_can_tell_jokes_to_ali_and_ali_learns_jokes
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)
    assert_equal [@joke_1, @joke_2], @ali.jokes
  end

  def test_jokes_can_be_identified_by_id
    @sal.tell(@ali, @joke_1)
    @ali.joke_by_id(1)
    assert_equal [@joke_1], @ali.joke_by_id(1)
  end

  def test_jokes_can_be_identified_by_different_id
    @sal.tell(@ali, @joke_2)
    @ali.joke_by_id(2)
    assert_equal [@joke_2], @ali.joke_by_id(2)
  end
end
