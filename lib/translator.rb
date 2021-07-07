# require modules here
require 'yaml'
require 'pry'
def load_library(filepath)
  get_emoticon = {}
  get_meaning = {}
  YAML.load_file(filepath).each do |k, v|
    get_meaning[v[1]] = k
    get_emoticon[v[0]] = v[1]
  end
  result = {}
  result["get_meaning"] = get_meaning
  result["get_emoticon"] = get_emoticon
  result
end

def get_japanese_emoticon(filepath, emoticon)
  dictionary = load_library(filepath)
  dictionary['get_emoticon'][emoticon] ? dictionary['get_emoticon'][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  dictionary = load_library(filepath)
  dictionary['get_meaning'][emoticon] ? dictionary['get_meaning'][emoticon] : "Sorry, that emoticon was not found"
end