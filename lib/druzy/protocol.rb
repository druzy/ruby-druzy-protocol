require_relative 'protocol/version'
require_relative 'protocol/device'

module Druzy
  module Protocol

    class Discoverer
      @@discoverers=[]
      @@plugin_dir=File.dirname(__FILE__)+'/protocol/plugin/'
      #@@plugin_dir="/usr/lib/ruby/vendor_ruby/druzy"+"/protocol/plugin/"

      def self.get_discoverers
        Dir[File.join(@@plugin_dir, '*.rb')].each {|file| require "druzy/protocol/plugin/"+File.basename(file,"*.rb")}
        return @@discoverers
      end

      def self.inherited(klass)
        @@discoverers << klass.new
      end

    end

  end
end
