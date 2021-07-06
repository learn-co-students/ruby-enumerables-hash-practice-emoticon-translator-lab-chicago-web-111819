# require modules here
require 'yaml'
require 'pry'

# Generic vars
$emo_not_found_msg = "Sorry, that emoticon was not found"
$get_em = ["get_emoticon", "get_meaning"]

def load_library(lib_path)
  emoticons = YAML.load_file(lib_path)
  emoticon_hash = {}

  emoticon_hash[$get_em[0]] = {}
  emoticon_hash[$get_em[1]] = {}

  emoticons.each do |engo_word, emoti_set|
    emoticon_hash[$get_em[0]][emoti_set.first] = emoti_set.last
    emoticon_hash[$get_em[1]][emoti_set.last] = engo_word
  end
  emoticon_hash
end

def get_japanese_emoticon(lib_path, emoticon)
  emoticon_hash = load_library(lib_path)
  result = emoticon_hash[$get_em[0]][emoticon]
  if result == nil
    result = $emo_not_found_msg
  end
  result
end

def get_english_meaning(lib_path, emoticon)
  emoticon_hash = load_library(lib_path)
  result = emoticon_hash[$get_em[1]][emoticon]
  if result == nil
    result = $emo_not_found_msg 
  end
  return result
end