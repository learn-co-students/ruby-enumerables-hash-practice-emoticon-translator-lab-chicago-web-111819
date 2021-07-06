# require modules here
require 'pp'
require "yaml"

def load_library(file_path)
  emotes = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do | meaning, ej_array |
    english, japanese = ej_array
    emotes["get_meaning"][japanese] = meaning
    emotes["get_emoticon"][english] = japanese
  end
  emotes
end

def get_japanese_emoticon(file_path, emoticon)
  emote_library = load_library(file_path)
  japanese_equivalent_emote = emote_library["get_emoticon"][emoticon]
  if japanese_equivalent_emote
    japanese_equivalent_emote
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emote_library = load_library(file_path)
  english_meaning = emote_library["get_meaning"][emoticon]
  if english_meaning
    english_meaning
  else
    "Sorry, that emoticon was not found"
  end
end