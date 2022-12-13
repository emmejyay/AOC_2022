require 'pry'

# Sabqponm # v..v<<<<
# abcryxxl # >v.vv<<^
# accszExk # .>vv>E^^
# acctuvwj # ..v>>>^^
# abdefghi # ..>>>>>^

# Declare a queue and insert the starting point.
# Initialize a visited array and mark the starting point as visited.

# Follow the below process till the queue becomes empty:

# Remove the first point of the queue.
# Mark that point as visited.
# Insert all the unvisited neighbours of the point into the queue.

MAP = File.read('sample.txt').split("\n").map do |line|
  line.chars.map do |c|
    if ['S', 'E'].include?(c)
      if c == 'S'
        0
      else
        27
      end
    else
      c.ord - 96
    end
  end
end

p MAP

425

418

# Declare a queue and insert the starting point.
queue = [[0, 0]]
# Initialize a visited array and mark the starting point as visited.
# Y X
VISITED = []

# point = [Y, X]
def get_neighbours(point)
  value = MAP[point[0]][point[1]]
  x = point[1]
  y = point[0]
  neighbours = []
  [-1, 0, 1].each do |neighbour_y|
    next if y + neighbour_y > MAP.size - 1 || y + neighbour_y < 0

    [-1, 0, 1].each do |neighbour_x|
      #                                                                    2 Diagonals + self             2 Diagonals
      next if x + neighbour_x > MAP.size - 1 || x + neighbour_x < 0 || neighbour_x == neighbour_y || neighbour_x == - neighbour_y

      neighbour_value = MAP[y + neighbour_y][x + neighbour_x]
      neighbours << [y + neighbour_y, x + neighbour_x] if neighbour_value - value <= 1
    end
  end
  neighbours.reject { |p| VISITED.include?(p) }
end

# Follow the below process till the queue becomes empty:
until queue.empty?
  # Remove the first point of the queue.
  point = queue.pop
  # Mark that point as visited.
  VISITED << point
  # Insert all the unvisited neighbours of the point into the queue.
  neighbours = get_neighbours(point)

  queue = [*queue, *neighbours]
  binding.pry if queue.empty?
end

p VISITED.size
# Sabqponm # v..v<<<<
# abcryxxl # >v.vv<<^
# accszExk # .>vv>E^^
# acctuvwj # ..v>>>^^
# abdefghi # ..>>>>>^
