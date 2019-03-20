class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(name, joke)
    name.learn(joke)
  end

  def joke_by_id(id)
    jokes.find { jokes.include?(id) }
    jokes
  end
end
