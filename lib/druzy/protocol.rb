require 'druzy/protocol/version'

module Druzy
  module Protocol
    
    class Discoverer
      @@discoverers=[]
      @@plugin_dir=File.dirname(__FILE__)+'/protocol/plugin/'
      
      def self.get_discoverers
        Dir[File.join(@@plugin_dir, '*.rb')].each {|file| require "druzy/protocol/plugin/"+File.basename(file,"*.rb")}
      end
      
      def inherited(klass)
        @@discoverers << klass.new
      end
      
      def get_ports
        return []
      end
      
      def start_discoverer(delay=10, identifier=nil, &discovery_listener)
      end
      
      def stop_discoverer
      end
      
      def restart_discoverer
      end
    end
    
  end
end