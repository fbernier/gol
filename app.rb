class Cell
  attr_accessor :world, :x, :y

  def initialize(world, x = 0, y = 0)
    @world = world
    @x = x
    @y = y
    world.cells << self
  end

  def neighbors
    @neighbors = []
    world.cells.each do |cell|
      # Has a cell to the north
      if self.x == cell.x && self.y == cell.y - 1
        @neighbors << cell
      end

      # Has a cell to the south
      if self.x == cell.x && self.y == cell.y + 1
        @neighbors << cell
      end

      # Has a cell to the east
      if self.x == cell.x - 1 && self.y == cell.y
        @neighbors << cell
      end

      # Has a cell to the west
      if self.x == cell.x + 1 && self.y == cell.y
        @neighbors << cell
      end
    end
    @neighbors
  end

  def spawn_at(x, y)
    Cell.new(world, x, y)
  end
end

class World
  attr_accessor :cells

  def initialize
    @cells = []
  end
end
