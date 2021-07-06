class Cat
  @@all = []

  #attributes created and made visible/editable outside the Cat object (i.e., owner object)
  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner, mood="nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end

  def owner=(owner)
    @owner=owner
  end

  def self.all
    @@all
  end
end