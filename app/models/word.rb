class Word < ActiveRecord::Base
  ## CUSTOM METHODS

  def self.random
    # all = Word.all
    # all[rand(all.size)]
    Word.offset(rand(Word.count)).take
  end

  # OPTIMIZE: Pick up a random translated word.
  # Don't use Word.order("RAND()").take it hurts your DB performance
  #
  def self.random_translated_word
    Word.all.select {|word|word.translated?}.sort_by {rand}[0]

    # Hint: Generate a random number as an index offset.
    # Index values must span [0,n-1]; n=table_size,
    # then pick up the first record.
    #
    # Word.where.not(spanish: nil).offset(rand(Word.count)).take
  end

  def self.add word, translation
    unless word.blank? || translation.blank?
      if Word.find_by(english: word).nil?
        Word.new(english: word, spanish: translation).save
      end
    end
  end

  def self.add_content content
    if not content.empty?
      content.split(" ").each do |english_word|
        if Word.find_by(english: english_word).nil?
          Word.new(english: english_word).save
        end
      end
    end
  end

  def translated?
    english and spanish
  end
end
