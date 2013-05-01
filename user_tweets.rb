require "open-uri"
 require "JSON"

# puts "Enter you twitter name"
# twitter_user=ARGV.gets
# remote_base_url = "http://api.twitter.com/1/statuses/user_timeline.json?count=10&screen_name="
# remote_full_url = remote_base_url + twitter_user

# tweets = open(remote_full_url).read
# tweets_to_json=JSON(tweets)
# tweets_to_json.first["text"]
# tweets_to_json.each do |tweet|
# 	tweet["text"]
# end


Shoes.app do
  background "#c0deed"
  border(
    "#303030",
    :strokewidth => 6
  )
  stack(:margin => 12) do
    para "Twitter UserName"
    flow do
      @twitter_name=edit_line
      @tweet_stack=" "
      button "Get Tweets" do
    	  @twitter_url = "http://api.twitter.com/1/statuses/user_timeline.json?count=10&screen_name="
    	  remote_full_url = @twitter_url + @twitter_name.text
        
        tweets = open(remote_full_url).read
				tweets_to_json=JSON(tweets)
   			tweets_to_json.first["text"]
   			@tweet_stack=stack(:margin => 20) do 
					tweets_to_json.each do |tweet|
				 	@tweet_stack =	para tweet["text"]
 					end
 				end
      end
      button "clear" do 
 					@tweet_stack.clear
 			end
    end
  end
end