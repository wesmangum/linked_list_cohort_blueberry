class LinkedListItem
  include Comparable
  attr_accessor :payload
  attr_reader :next_item

  def initialize(value)
    @payload = value
  end

  def next_item=(other_item)
    if self === other_item
      raise ArgumentError
    else
      @next_item = other_item
    end
  end

  def last?
    if @next_item == nil
      true
    else
      false
    end
  end

  def <=>(other_item)
    self.payload.to_s <=> other_item.payload.to_s
  end

  def ===(other_item)
    self.equal? other_item
  end
end
