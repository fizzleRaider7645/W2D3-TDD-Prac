require "rspec"
require "towers_of_hanoi"

describe "TowersOfHanoi" do
  describe "#move" do
    context "incorrect move" do
      it "does not place a bigger number on a smaller number" do
        ex_1 = TowersOfHanoi.new([[3], [2], [1]])
        expect{ex_1.move(1, 2)}.to raise_error("Can't move bigger number onto smaller number")
      end

      it "does not allow start position corresponding to an empty tower" do
        ex_1 = TowersOfHanoi.new([[3, 2], [], [1]])
        expect{ex_1.move(1, 2)}.to raise_error("Invalid move, empty tower at start position")
      end

      it "does not allow out of bounds move" do
        ex_1 = TowersOfHanoi.new([[3], [2], [1]])
        expect{ex_1.move(2, 3)}.to raise_error("Invalid move, can't move out of bounds")

        ex_2 = TowersOfHanoi.new([[3], [2], [1]])
        expect{ex_2.move(5, 0)}.to raise_error("Invalid start position")
      end
    end

    context "correct move" do
      it "performs a correct move" do
        ex_1 = TowersOfHanoi.new
        ex_1.move(0, 2)
        expect(ex_1.towers).to eq([[3, 2], [], [1]])
        ex_1.move(0, 1)
        expect(ex_1.towers).to eq([[3], [2], [1]])
        ex_1.move(2, 1)
        expect(ex_1.towers).to eq([[3], [2, 1], []])
      end
    end
  end

  describe "#won?" do
    it "returns true when the game has been won" do
      winning_config_1 = TowersOfHanoi.new([[], [3, 2, 1], []])
      winning_config_2 = TowersOfHanoi.new([[], [], [3, 2, 1]])

      expect(winning_config_1.won?).to be(true)
      expect(winning_config_2.won?).to be(true)
    end

    it "returns false when the game has not been won" do
      starting_config = TowersOfHanoi.new
      in_progress_1 = TowersOfHanoi.new([[3], [2], [1]])
      in_progress_2 = TowersOfHanoi.new([[3], [2, 1], []])
      in_progress_3 = TowersOfHanoi.new([[3], [], [2, 1]])
      in_progress_4 = TowersOfHanoi.new([[3], [1], [2]])
      in_progress_5 = TowersOfHanoi.new([[], [3], [2, 1]])
      in_progress_6 = TowersOfHanoi.new([[], [3, 1], [2]])

      expect(starting_config.won?).to be(false)
      expect(in_progress_1.won?).to be(false)
      expect(in_progress_2.won?).to be(false)
      expect(in_progress_3.won?).to be(false)
      expect(in_progress_4.won?).to be(false)
      expect(in_progress_5.won?).to be(false)
      expect(in_progress_6.won?).to be(false)
    end
  end
end
