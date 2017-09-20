class Word
  @@word_list = []
  @definitions = []
  attr_accessor :word
  attr_reader :id

  def initialize(attributes)
    @word = attributes.fetch('word')
    @id = @@word_list.length + 1
  end

  def self.all
    @@word_list
  end

  def self.clear()
    @@word_list = []
  end

  def self.find(id)
    word_id = id.to_i()
    @@word_list.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

  def self.sort()
    @@word_list.sort_by { |word| word.word}
  end

  def add_word
    @@word_list.push(self)
  end

  def add_def(definition)
    @definitions.push(definition)
  end


end #Word class
