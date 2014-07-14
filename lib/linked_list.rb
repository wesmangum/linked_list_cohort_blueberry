class LinkedList

  attr_accessor :size

  def initialize(*items)
    @size = 0
    unless items == nil
      items.each {|thing| push(thing)}
    end
    size
  end

  def last
    return last_item.payload if @size > 0
  end

  def to_s
    return "| |" if @size == 0
    payloads = "| "
    count = 0
    while count < @size
      payloads << get(count)
      if find_by_index(count).next_item
        payloads << ", "
      end
      count += 1
    end
    payloads << " |"
    # "| #{payloads.join(", ")} |"
  end

  def [](index)
    get(index)
  end

  def []=(index, str)
    item = find_by_index(index)
    item.payload = str
    item.payload
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
    item = find_by_index(index)
    item.payload
  end

  def delete(index)
    if index == 0
      item = find_by_index(1)
      @first_item = item
    else
      item = find_by_index(index)
      prev_pos = find_by_index(index - 1)
      next_pos = find_by_index(index + 1)
      prev_pos.next_item = next_pos
    end
    @size -= 1
  end

  def index(str)
    find_by_str(str)
  end

  def find_by_index(index)
    raise IndexError if index < 0
    current_item = @first_item
    index.times do
      raise IndexError if current_item == nil
      current_item = current_item.next_item
    end
    current_item
  end

  def find_by_str(str)
    count = 0
    current_item = @first_item
    while count < size
      return count if current_item.payload == str
      current_item = current_item.next_item
      count += 1
    end
  end

  def sorted?
    true
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
