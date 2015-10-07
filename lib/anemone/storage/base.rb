require 'anemone/storage/exceptions'

module Anemone
  module Storage
    class Base

      def initialize(adapter)
        @adap = adapter

        required_methods = [:clear ,:[] ,:[]= ,:delete ,:each ,:merge! ,:close ,:size ,:keys ,:has_key?]
        required_methods.each do |method|
          if !@adap.respond_to?(method.to_sym)
            raise "Storage adapter must support method #{method}"
          end
        end
      end

      #def loaddata(link_queue, page_queue)
        #@adap.loaddata(link_queue, page_queue)
        #rescue
        #  raise InsertionError, $!
      #end

      def clear()
        @adap.clear
        rescue
          raise CloseError, $!
      end

      def [](key)
        @adap[key]
        rescue
          puts key
          raise RetrievalError, $! 
      end

      def []=(key, value)
        @adap[key] = value
        rescue
          raise InsertionError, $!
      end

      def delete(key)
        @adap.delete(key)
        rescue
          raise DeletionError, $!
      end

      def each
        @adap.each { |k, v| yield k, v }
        rescue
          raise GenericError, $!
      end

      def merge!(hash)
        @adap.merge!(hash)
        rescue
          raise GenericError, $!
      end

      def close
        @adap.close
        rescue
          raise CloseError, $!
      end

      def size
        @adap.size
        rescue
          raise GenericError, $!
      end

      def keys
        @adap.keys
        rescue
          raise GenericError, $!
      end

      def has_key?(key)
        @adap.has_key?(key)
        rescue
          raise GenericError, $!
      end

    end
  end
end
