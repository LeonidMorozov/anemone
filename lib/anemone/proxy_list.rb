module Anemone
  class ProxyList

    #
    # Create a new ProxyList
    #
    def self.load(list)
      @list = list.to_a
      @counter = 0
      new_proxy
    end

    #
    # Get next proxy from loaded list
    #
    def self.new_proxy
      p "Proxy before: #{@cur_proxy}"
      begin
        @cur_proxy = @list[@counter]
        @counter +=1
        @counter = 0 if @counter >= @list.size
      end if @list.size>@counter
      p "Proxy after: #{@cur_proxy}"
      @cur_proxy
    end

    #
    # Get current proxy
    #
    def self.get_proxy
      @cur_proxy
    end
  end

end
