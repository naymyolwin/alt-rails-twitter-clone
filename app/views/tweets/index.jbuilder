json.tweets do
    json.array! @tweets do |tweet|
        json.id         tweet.id
      json.username     tweet.user.username
      json.message      tweet.message
      json.updated_at   tweet.updated_at
      json.created_at   tweet.created_at
    end
  end