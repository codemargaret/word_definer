class Word
  @@word_list = []

  attr_accessor :word, :definitions
  attr_reader :id

  def initialize(attributes)
    @word = attributes.fetch('word')
    @definitions = []
    @id = @@word_list.length + 1
  end

  def self.all
    @@word_list
  end

  def self.clear()
    @@word_list = []
  end

  # def self.find(id)
  #   word_id = id.to_i()
  #   @@word_list.each do |word|
  #     if word.id == word_id
  #       return word
  #     end
  #   end
  # end

  def self.find(id)
    word_id = id.to_i()
    @@word_list.find {|word| word.id == word_id}
  end

  def self.sort()
    @@word_list.sort_by { |word| word.word}
  end

  def add_word
    @@word_list.push(self)
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

  def show_defs
    @definitions
  end

end #Word class
