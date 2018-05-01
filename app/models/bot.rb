class Bot < ApplicationRecord
  def self.search_words(search)
    CLIENT.search(search, lang: "en").first.text
  end

  def self.update(something)
    CLIENT.update(something)
  end

  def self.favorites
    favs = CLIENT.favorites
    favs.each do |f|
      puts f.id
    end
  end

  def self.replies
    replies = CLIENT.reply
  end

  def self.followers
    CLIENT.followers
  end

  def self.dm(message)
    CLIENT.create_direct_message('benjamin_pena', message)
  end

  def self.sjb
    CLIENT.search("from:benjamin_pena example", result_type: "recent").take(3).each do |tuit|
      puts tuit.text
    end
  end

  def self.pendings
    pendings = CLIENT.friendships_incoming
    puts pendings.count
  end
end
