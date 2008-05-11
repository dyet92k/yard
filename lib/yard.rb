$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'yard')

['logger'].each do |file|
  require File.join(File.dirname(__FILE__), 'yard', file)
end

module YARD
  VERSION = "0.2.1"
  
  module CodeObjects; end
  module Generators; end
  module Parser
    module Lexer; end
    module Ruby; end
  end
  module Handlers; end
  module TagLibrary; end
end

%w[ 
  symbol_hash
  code_objects/base 
  code_objects/namespace_object
  code_objects/*
  parser/**/*
  handlers/base
  handlers/*
  registry
  tag_library
].each do |file|
  file = File.join(File.dirname(__FILE__), 'yard', file + ".rb")
  Dir[file].each do |f|
    if require(f)
      log.debug "Loading #{f}..."
    end
  end
end