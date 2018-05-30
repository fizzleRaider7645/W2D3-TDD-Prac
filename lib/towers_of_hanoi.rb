require 'byebug'

class TowersOfHanoi
  attr_reader :towers

  def initialize(towers = [[3,2,1], [], []])
    @towers = towers
  end

  def move(start_pos, end_pos)
    if check_valid_move(start_pos, end_pos)
      towers[end_pos] << towers[start_pos].pop
    end
  end

  def won?
    towers == [[], [3,2,1], []] || towers == [[], [], [3,2,1]]
  end

  private

  def in_bounds?(pos)
    (0..2).to_a.include?(pos)
  end

  def bigger_disc_onto_smaller_disc?(start_pos, end_pos)
    towers[end_pos].last != nil && towers[start_pos].last > towers[end_pos].last
  end

  def check_valid_move(start_pos, end_pos)
    raise "Invalid end position" unless in_bounds?(end_pos)
    raise "Invalid start position" unless in_bounds?(start_pos)
    raise "Invalid move, empty tower at start position" if towers[start_pos].empty?
    raise "Can't move bigger number onto smaller number" if bigger_disc_onto_smaller_disc?(start_pos, end_pos)
    true
  end
end
