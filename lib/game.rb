module GoL
  class Game
    attr_reader :count, :board

    def initialize(board)
      @board = board
      @size = get_size(@board)
      @count = 0
    end

    def tick
      new_board = Array.new(@size[:y]) { Array.new(@size[:x]) }
      @count = 0
      (0...@size[:y]).each do |y|
        (0...@size[:x]).each do |x|
          position = {x: x, y: y}
          if how_many_neighbours(position) < 2
            new_board[y][x] = 0
          elsif how_many_neighbours(position) > 3
            new_board[y][x] = 0
          elsif how_many_neighbours(position) == 3
            new_board[y][x] = 1
          else
            new_board[y][x] = @board[y][x]
          end
          @count += 1
        end
      end
      @board = new_board
      return @board

    end

    private

    def get_size(board)
      size = {x: 0, y: 0}
      return size if board.size == 0
      return size if board[0].size == 0
      size[:y] = board.size
      size[:x] = board[0].size
      return size
    end

    def how_many_neighbours(position)
      how_many = 0
      how_many +=1 if cell_on_the_east?(position)
      how_many +=1 if cell_on_the_west?(position)
      how_many +=1 if cell_on_the_north?(position)
      how_many +=1 if cell_on_the_south?(position)
      how_many +=1 if cell_on_the_north_east?(position)
      how_many +=1 if cell_on_the_north_west?(position)
      how_many +=1 if cell_on_the_south_east?(position)
      how_many +=1 if cell_on_the_south_west?(position)
      return how_many
    end

    def cell_on_the_east?(position)
      return false if position[:x] == @size[:x] - 1
      if @board[ position[:y] ] [ position[:x] + 1 ] == 0
        return false
      elsif @board[ position[:y] ] [ position[:x] + 1 ] == nil
        return false
      else
        return true
      end
    end

    def cell_on_the_west?(position)
      return false if position[:x] == 0
      if @board[ position[:y] ] [ position[:x] - 1 ] == 0
        return false
      elsif @board[ position[:y] ] [ position[:x] - 1 ] == nil
        return false
      else
        return true
      end
    end

    def cell_on_the_north?(position)
      return false if position[:y] == 0
      if @board[ position[:y] - 1 ] [ position[:x] ] == 0
        return false
      elsif @board[ position[:y] -1] [ position[:x] ] == nil
        return false
      else
        return true
      end
    end

    def cell_on_the_south?(position)
      return false if position[:y] == @size[:y] - 1
      if @board[ position[:y] + 1 ] [ position[:x] ] == 0
        return false
      elsif @board[ position[:y]+1 ] [ position[:x] ] == nil
        return false
      else
        return true
      end
    end
    ######################
    def cell_on_the_north_east?(position)
      return false if position[:y] == 0
      return false if position[:x] == @size[:x] - 1
      if @board[ position[:y] - 1 ] [ position[:x]+1 ] == 0
        return false
      elsif @board[ position[:y] -1] [ position[:x]+1 ] == nil
        return false
      else
        return true
      end
    end

    def cell_on_the_north_west?(position)
      return false if position[:y] == 0
      return false if position[:x] == 0
      if @board[ position[:y] - 1 ] [ position[:x]-1 ] == 0
        return false
      elsif @board[ position[:y] -1] [ position[:x]-1 ] == nil
        return false
      else
        return true
      end
    end

    def cell_on_the_south_east?(position)
      return false if position[:y] == @size[:y] - 1
      return false if position[:x] == @size[:x] - 1

      if @board[ position[:y] + 1 ] [ position[:x]+1 ] == 0
        return false
      elsif @board[ position[:y]+1 ] [ position[:x]+1 ] == nil
        return false
      else
        return true
      end
    end

    def cell_on_the_south_west?(position)
      return false if position[:y] == @size[:y] - 1
      return false if position[:x] == 0

      if @board[ position[:y] + 1 ] [ position[:x]-1 ] == 0
        return false
      elsif @board[ position[:y]+1 ] [ position[:x]-1 ] == nil
        return false
      else
        return true
      end
    end


  end

end
