require 'pry'
require "yaml"# require modules here

def load_library(file_path)
  # code goes here
  emotes = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  emotes.each do |meaning, emoticons|
     
    result["get_meaning"][emoticons[1]] = meaning 
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  return result
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', emoticon)
  # code goes here
  emotes = load_library(file_path)
  
  if emotes["get_emoticon"].include?(emoticon)
    return emotes["get_emoticon"][emoticon]
  else 
    p "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
   emotes = load_library(file_path)
  
  if emotes["get_meaning"].include?(emoticon)
    return emotes["get_meaning"][emoticon]
  else 
    p "Sorry, that emoticon was not found"
  end
end