class Robot
  attr_reader :position, :items, :health
  def initialize
    @position = [0,0]
    @items = []
    @health = 100
  end

  def move_down
    position[1] += (-1)
  end

  def move_left
    position[0] += (-1)
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def pick_up(item)
    raise ArgumentError if (items_weight + item.weight) > 250
    @items << item
  end

  def items_weight
    @items.inject(0){|acc, ele| acc + ele.weight}
  end

  def wound(amount)
    @health += (-amount)
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

end


class Item
  attr_reader :name, :weight
  def initialize(name, weight)
    @name = name
    @weight = weight
  end
end

class Bolts
  def initialize
  end
end

class Weapon
  def initialize
  end
end

class Laser
  def initialize
  end
end

class PlasmaCannon
  def initialize
  end
end
