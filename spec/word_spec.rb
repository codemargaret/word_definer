require('rspec')
require('pry')
require('word')

describe("Word") do
  before() do
      Word.clear()
    end

  describe('#word') do
    it('saves a value in word') do
      word = Word.new({"word" => "continent"})
      expect(word.word).to(eq("continent"))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      word1 = Word.new({"word" => "continent"})
      word1.add_word()
      word2 = Word.new({"word" => "country"})
      word2.add_word()
      expect(word1.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

  describe('#add_word') do
    it("adds words to the word list") do
      word1 = Word.new({"word" => "continent"})
      word1.add_word()
      word2 = Word.new({"word" => "country"})
      word2.add_word()
      expect(Word.all()).to(eq([word1, word2]))
    end
  end

  describe('.find') do
    it('returns a word with a specific id') do
      word = Word.new({"word" => "continent"})
      word.add_word()
      expect(Word.find(1)).to(eq(word))
    end
  end

  describe('.sort') do
    it('puts the list in alphabetical order') do
      word1 = Word.new({"word" => "country"})
      word1.add_word()
      word2 = Word.new({"word" => "delta"})
      word2.add_word()
      word3 = Word.new({"word" => "continent"})
      word3.add_word()
      expect(Word.sort()).to(eq([word3, word1, word2]))
    end
  end

  describe('.add_def') do
    it('adds a definition to the definition list') do
      word = Word.new({"word" => "continent"})
      word.add_word()
      word.add_def("one of the seven main landmasses on the Earth")
      expect(@definitions).to(eq("one of the seven main landmasses on the Earth"))
    end
  end

  # word1 = Word.new({"word" => "country", "definition" => "a nation with its own government on a particular piece of land", "def2" => "", "def3" => ""})
  # word2 = Word.new({"word" => "delta", "definition" => "a trangular soil deposit at the mouth of a river", "def2" => "", "def3" => ""})
  # word3 = Word.new({"word" => "continent","definition" => "one of the seven main landmasses on the Earth", "def2" => "", "def3" => ""})

end #Word class
