require "dump_to_seeds/version"
require "dump_to_seeds/base_ext"

module DumpToSeeds

  ActiveRecord::Base.send :include, DumpToSeeds::BaseExt

end
