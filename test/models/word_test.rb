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

  # Add a new word in the dictionary test
  def test_count_after_add
    count = Word.count
    new_word = 'life'
    new_translation = 'vida'

    if not Word.exists?(english: new_word)
      Word.add(new_word, new_translation)
      assert_equal count + 1, Word.count
    else
      assert false, "\'#{new_word}\' ya está definida test/fixtures/words.rb, new_word debe ser una palabra nueva"
    end
  end

  # Repeated words are not allowed for add method
  def test_count_after_add_repeated_word
    count = Word.count

    # Add a new word
    Word.add('moon', 'luna')
    count_after = Word.count
    assert_equal count + 1, count_after

    # Try to add an already added word
    Word.add('moon', 'luna')
    assert_equal count_after, Word.count
  end

  # Empty words are not allowed in any form (nil, '', ' ') for add method
  def test_count_after_add_nil_word
    count = Word.count
    Word.add(nil, nil)
    Word.add(nil, 'nulo')
    Word.add('example', nil)
    assert_equal count, Word.count
  end

  def assert_count_after_add(count, content)
    Word.add_content(content)
    assert_equal count, Word.count
  end

  # Repeteated words are not allowed for add_content method
  def test_add_content
    count = Word.count
    assert_count_after_add count, ""
    assert_count_after_add count + 1, "single"
    assert_count_after_add count + 3, "two words"
    assert_count_after_add count + 7, "four elements are funny"
    assert_count_after_add count + 8, "duplicate duplicate"
  end

  def test_translated
    assert !Word.new.translated?
    assert (Word.new english: 'yes', spanish: 'sí').translated?
    assert !(Word.new spanish: 'sí').translated?
    assert !(Word.new english: 'yes').translated?
  end

  def test_use_words_with_translated_word
    Word.new(english: 'yes', spanish: 'sí').save
    Word.add_content 'untranslated'
    randoms = []
    100.times {randoms << Word.random_translated_word.english}
    assert_not randoms.include? 'untranslated'
  end
end
