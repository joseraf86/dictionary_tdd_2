class Word < ActiveRecord::Base
  ## CUSTOM METHODS
  # OPTIMIZE Get a random word without loading all words into main memory 
  def self.random
    all = Word.all
    all[rand(all.size)]
  end
end
