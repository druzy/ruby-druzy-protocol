module Druzy
  module Protocol
    
    class Device
      attr_reader :identifier, :protocol, :name, :icon
      
      def initialize(identifier,protocol,name,icon)
        @identifier=identifier
        @protocol=protocol
        @name=name
        @icon=icon
      end
    end
    
    class Renderer < Device
      attr_accessor :duration, :time_position, :volume, :volume_min, :volume_max, :mute
      def initialize(identifier, protocol, name, icon, duration=Time.at(0).utc, time_position=Time.at(0).utc,volume=100,volume_min=0,volume_max=100,mute=false)
        super(identifier,protocol,name,icon)
        @duration=duration
        @time_position=time_position
        @volume=volume
        @volume_min=volume_min
        @volume_max=volume_max
        @mute=mute
        
      end
      
      def play
      end
      
      def pause
      end
      
      def stop
      end
      
      def send(file)
      end
    end
  
  end
end