require 'pry'
require_relative 'models/user'
require_relative 'models/tweet'

coffee_dad = User.new("coffee dad", "a dad who loves coffee#")
chase = User.new("chase the coach", "i love tea! let's talk about my tea cabinet")
sylwia = User.new("sylwia", "just water for me")

tweet1 = Tweet.new("just gimme coffee", coffee_dad)
tweet2 = Tweet.new("what is self", coffee_dad)
tweet3 = Tweet.new("have #a coffee", coffee_dad)
tweet4 = Tweet.new("got beans?", coffee_dad)
tweet_chase = Tweet.new("i just got my tea order", chase)

chase.post_tweet("I can't wait to have tea break")
chase.average_tweet_length
coffee_dad.average_tweet_length

binding.pry
"☕️ ☕️ ☕️"