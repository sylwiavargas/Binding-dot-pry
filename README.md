# Binding.pry

Welcome to Quote Treasure.

```
   User --------------< Tweet
   :username           :content
                       :user
```

## Functionality

- `User#print_all_tweets` - `puts` a list of all tweets by a User, e.g.

"
Username:
✨ Their first tweet

✨ Their second tweet
"

^ this one needs work

- `Tweet.print_all_tweets` - `puts` a list of all tweets by all Users following the above format

^ to develop

- `User#average_tweet_length` - `puts` "NAME's average tweet length is NUMBER"

^ this one works (maybe?)

- `User.longest_tweets` - returns an instance of a User who writes the longest tweets on average

^ this one breaks?!?!


-----------
## Self-Study Guide

- `User#print_all_tweets`
   - run this method to see that it is giving us weird output; 
   - place the `binding.pry` inside the block (between the lines 24 and 25) and investigate `tweet.content` for each tweet (so, exit the pry session and move onto the next one)
      - you will see that it is correct for every tweet
      - so you can refactor it to `tweet.content`; however, the q remains about WHY we had weird output - read the existing code in other files and look for what can be responsible for this situation!
      - the answer is that I overwrote `to_s` on Tweet model so Ruby translates the Tweet instance to gibberish; alternatively, you can also change the body of `to_s` to `content` so it will be always giving us the content and not memory path when the Tweet instance is interpolated
- `Tweet.print_all_tweets`
   - what are the methods available at your disposal... for example the one we just refactored!
   - place `binding.pry` on the first line of the body of this method, get inside that method and look for how you can use the `User#print_all_tweets` to achieve our goal
      - the answer is: `User.all.each{|user| user.print_all_tweets}` 
      - printing all tweets is a behavior of the Tweet class but printing all tweets that belong to a User is a behavior of a User instance so they live in two different models
- `User.longest_tweets`
   - heads up: this method is breaking in numerous places!
   - first, there’s no `self.all` method on User so maybe build that one first :) 
   - then, you are getting `NoMethodError: undefined method first for nil:NilClass` so place `binding.pry` inside the method and check what `User.all` is
   - you will see that the array is empty -- try making guess why that can be; 
   - the reason is that actually we never push a newly-created user instance into the class `@@all` so do that as well :)
   - once you fix that, you will get `ZeroDivisionError: divided by 0`; place `binding.pry` inside the block in `User.longest_tweets` method and check what tweets they have; the third user will give you an error because they don't have any tweets so we need to fix the other method now so the lack of tweets won't impact our code
   - place `binding.pry` inside `User#average_tweet_length` and call it on the user that has no tweets; try to find a solution for this problem -- how not ot break this method if there's no tweets? 
   - one way to go about it to add an "or" operator: 
   ```ruby
   0 || tweets.sum{|tweet| tweet.length} / tweets.size.to_f
   ```
   in this case, Ruby will return 0 if the return value is otherwise `nil`