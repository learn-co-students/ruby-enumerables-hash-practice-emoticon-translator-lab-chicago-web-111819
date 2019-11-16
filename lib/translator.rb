# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  
  emo_meanings = YAML.load_file(file)
  
  emoticons_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  
  emo_meanings.each do |meanings, emoarray|
      emoticons_hash[:get_meaning][emoarray[1]] = meanings
      emoticons_hash[:get_emoticon][emoarray[0]] = emoarray[1]
  end
  
  emoticons_hash
end

def get_japanese_emoticon(file, engemoticon)
  emolibrary = load_library(file)

  emolibrary.each do |toget, translations|
    translations.each do |key, value|
      if key == engemoticon
        return value
      end
    end
  end
  
  # calls on load_library(file)
  # returns Japanese equivalent of English emoticon
  # returns an apology message if argument is not a known emoticon 
  # binding.pry
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, jpnemoticon)
  emolibrary = load_library(file)
  
  emolibrary.each do |toget, translations|
    translations.each do |key, value|
      if key == jpnemoticon
        return value
      end
    end
  end
  
  # calls on load_library(file)
  # returns english meaning of Japanese emoticon
  # returns an apology message if argument is not a known emoticon
  return "Sorry, that emoticon was not found"
end