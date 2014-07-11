class LinkedList
  attr_reader :array
  def initialize(item=nil)
    if item
      @array = [item]
    else
      @array = []
    end

    def size
      @array.length
    end
  end

  def push(item)
    @array.push(item)
  end

  def get(index)
    if index < 0 || @array[index] === nil
      raise IndexError
    else
      @array[index]
    end
  end

  def last
    @array[-1]
  end

  def to_s

  end
end
