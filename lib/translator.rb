require "yaml"


def load_library(file_path)
  
  emoticons = YAML.load_file(file_path)
  
  new_hash = {
    "get_meaning": {}, 
    "get_emoticon": {}
  }
  
  emoticons.each do |meaning, emoticon|
    new_hash[:get_meaning][emoticon[1]] = meaning
    new_hash[:get_emoticon][emoticon[0]] = emoticon[1]
  end
    
  new_hash
  
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  
  if library[:get_emoticon][emoticon]
    library[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  
  if library[:get_meaning][emoticon]
    library[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end