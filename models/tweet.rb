require 'pry'

class Tweet

    attr_reader :content, :user

    @@all = []

    def initialize(content_par, user_par)
        @content = content_par
        @user = user_par
        @@all << self
    end

    def self.all
        @@all
    end

    def username
        user.username  # method lookup chain -- it's the same as the above but sometimes has gotchas        
    end

    def length
        content.length
    end

    def generate_tweet
        max = $random_chars.length
        num = rand(0...max)
        $random_chars.sample(num).join("")
    end

    def to_s
        generate_tweet
    end
    
end

$random_chars = %w{🁒 ℊ ℀ ☁︎ ☼ ℥ ⚈ 🃘 ⎆ ⍒ ⎲ ⎢ ⏈ ┼ ⏋ ␎ ⑇ ⑉ ␦ ␥ ☠︎}