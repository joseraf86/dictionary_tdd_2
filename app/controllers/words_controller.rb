class WordsController < ApplicationController

  # GET /words/learn
  def learn
  	# This simple implementation will pass test_learn_passes_a_random_word test
  	# with the assert_kind_of implemenattion,
  	# but not with mocha enhanced implementation
  	# @word = Word.new

  	@word = Word.random
  end
end
