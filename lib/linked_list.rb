class LinkedList
  def initialize(*items)
    @size = 0
    unless items == nil
      items.each {|thing| push(thing)}
    end
    size
  end

  def size
    @size
  end

  def last
    return last_item.payload if @size > 0
  end

  def to_s
    return "| |" if @size == 0
    payloads = []
    count = 0
    while count < @size
      payloads << get(count)
      count += 1
    end
    "| #{payloads.join(", ")} |"
  end

  def push(item)
    lli = LinkedListItem.new(item)
    if @first_item
      last_item.next_item = lli
      @size += 1
    else
      @first_item = lli
      @size += 1
    end
  end

  def get(index)
    raise IndexError if index < 0
    current_item = @first_item
    index.times do
      raise IndexError if current_item == nil
      current_item = current_item.next_item
    end
    current_item.payload
  end

  private

  def last_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end
end
