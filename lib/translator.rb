# require modules here
require "yaml"

def load_library(file)
  data_hash = YAML.load_file(file)
  
  get_meaning = data_hash.map { |k,v| [v[1], k ] }.to_h
  get_emoticon = data_hash.map { |k,v| [v[0], v[1] ] }.to_h
  
  new_data = Hash.new
  
  new_data[:get_meaning] = get_meaning
  new_data[:get_emoticon] = get_emoticon
  new_data
end

def get_japanese_emoticon(file,amerimoji)
  hash = load_library(file)
  if hash[:get_emoticon][amerimoji]
    return hash[:get_emoticon][amerimoji]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file,emoji)
  hash = load_library(file)
  if hash[:get_meaning][emoji]
    return hash[:get_meaning][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end