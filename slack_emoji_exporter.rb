require 'net/http'
require 'json'
require 'open-uri'

TOKEN = ""
URL = "https://slack.com/api/emoji.list?pretty=1&token=" + TOKEN

res = Net::HTTP.get(URI.parse(URL))
JSON.parse(res)["emoji"].emojiList.each {|k, v|
  open(URI.parse(v)) do |file|
    File.open(k + ".png", "wb") do |out|
      out.write(file.read)
    end
  end
}
