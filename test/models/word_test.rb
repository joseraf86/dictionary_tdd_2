require 'test_helper'

class WordTest < ActiveSupport::TestCase

  def test_word_is_english_and_spanish
    word = Word.new english: 'never', spanish:'nunca'
    assert_equal 'never', word.english
    assert_equal 'nunca', word.spanish
  end

  fixtures :words
  # Check if Word.random generates a random numbre (model's responsability)
  def test_random
    results = []
    100.times {results << Word.random.english}
    # Having just 3 words in words.yml 
    # makes odds of having 'yes' word 
    # in random array quite high
    assert results.include?('yes')
  end
end
