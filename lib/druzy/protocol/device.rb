require 'druzy/mvc'

module Druzy
  module Protocol
    
    class Device < Druzy::MVC::Model
      attr_reader :identifier, :protocol, :name, :icon
      
      def initialize(identifier,protocol,name,icon)
        super()
        @identifier=identifier
        @protocol=protocol
        @name=name
        @icon=icon
      end
      
      #il faut faire le cas ou o est nil
      def ==(o)
        if !o.is_a? Device
          return false
        else
          return @identifier==o.identifier
        end
      end
    end
    
    class Renderer < Device
      attr_accessor :duration, :time_position, :volume, :volume_min, :volume_max, :mute, :current_file
      
      def initialize(identifier, protocol, name, icon, duration=Time.at(0).utc, time_position=Time.at(0).utc,volume=100,volume_min=0,volume_max=100,mute=false)
        super(identifier,protocol,name,icon)
        @duration=duration
        @time_position=time_position
        @volume=volume
        @volume_min=volume_min
        @volume_max=volume_max
        @mute=mute
        @current_file
      end
      
      def duration=(duration)
        @duration, old = duration, @duration
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"duration",old,@duration))
      end
      
      def time_position=(time_position)
        @time_position, old = time_position, @time_position
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"time_position",old,@time_position))
      end
      
      def volume=(volume)
        @volume, old = volume, @volume
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"volume",old,@volume))
      end

      def volume_min=(volume_min)
        @volume_min, old = volume_min, @volume_min
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"volume_min",old,@volume_min))
      end
      
      def volume_max=(volume_max)
        @volume_max, old = volume_max, @volume_max
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"volume_max",old,@volume_max))
      end
      
      def mute=(mute)
        @mute, old = mute, @mute
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"mute",old,@mute))
      end
      
      def current_file=(current_file)
        @current_file, old = current_file, @current_file
        fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,"current_file",old,@current_file))
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