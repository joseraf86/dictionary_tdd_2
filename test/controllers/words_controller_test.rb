require 'test_helper'
require 'mocha/mini_test'

class WordsControllerTest < ActionController::TestCase

  def test_learn_passes_a_random_word
    
    # We expect Word.random method wll be called and stub a random_word fixed value (mocha)
    random_word = Word.new(english: 'hello', spanish:'hola')
    Word.expects(:random).returns(random_word)

    # learn action gets called here
    get 'learn'

    # This test will pass as long as @word has a Word instance assigned.
    # The test fails to prove the controller's full responsability.
    # Controllers must get model's data and return it to the view.
    #
    # assert_kind_of Word, assigns('word')

    # Check if what's returned from the model (the stub value, random_word)
    # is passed to the view (@word).
    # How random_number is generated is the model's responsability.
    # Notice that the test database is bypassed by this stub technique.
    # 
    assert_equal random_word, assigns('word')

    # Check that the view has the following elements
    assert_select "div#word_container", {text: "hello"}, "Wrong word rendered"
    assert_select "div#translation_container", {text: "hola"}, "Wrong translation rendered"
  end
end
