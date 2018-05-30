require "rspec_practice"
require "rspec"

describe "my_uniq" do
  subject(:arr) { [1, 2, 1, 3, 3] }
  let(:all_uniq) { [1, 2, 3] }

  it "returns a new array" do
    output = my_uniq(all_uniq)
    expect(output).to_not be(all_uniq)
    expect(output).to be_a_kind_of(Array)
  end

  it "doesn't modify the original array" do
    output = my_uniq(arr)
    expect(output).to_not be(arr)
  end

  it "removes duplicates from the array" do
    expect(my_uniq(arr)).to eq([1, 2, 3])
  end

  it "returns the unique elements in order" do
    expect(my_uniq(arr)).to be_a_kind_of(Array)
    expect(my_uniq(arr)).to_not eq([2,3,1])
    expect(my_uniq(arr)).to_not eq([3,2,1])
    expect(my_uniq(arr)).to_not eq([3,1,2])
  end

  it "returns an empty array in the case of empty array" do
    expect(my_uniq([])).to eq([])
  end
end

describe "Array#two_sum" do
  it "only returns indices for discreet elements that sum to zero" do
    expect([1, 0, 3, 4, -4].two_sum).to eq([[3, 4]])
  end

  it "returns multiple pairs of elements" do
    expect([1, -1, 6, 4, -4, 7, 1423].two_sum).to eq([[0, 1], [3, 4]])
  end

  it "index pairs returned in ascending order" do
    expect([1, -1, 0, -1].two_sum).to eq([[0, 1], [0, 3]])
  end

  it "returns an empty array in the case of an empty array" do
    expect([].two_sum).to eq([])
  end

  it "returns an empty array if no pairs of elements sum to zero" do
    expect([543, -542, 2018, 17, -32, 25].two_sum).to eq([])
  end
end

describe "my_transpose" do
  it "returns an empty matrix for an empty array" do
    expect(my_transpose([[]])).to eq([[]])
  end

  it "returns an equivalent matrix for a 1x1" do
    expect(my_transpose([[1]])).to eq([[1]])
    expect(my_transpose([[2]])).to eq([[2]])

  end

  it "transposes a 2x2 matrix" do
    expect(my_transpose([[1, 2], [3, 4]])).to eq([[1, 3], [2, 4]])
  end

  it "transposes a 3x3 matrix" do
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
  it "transposes a nxn matrix" do
    a = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16]
    ]

    a_transpose = [
      [1, 5, 9, 13],
      [2, 6, 10, 14],
      [3, 7, 11, 15],
      [4, 8, 12, 16]
    ]

    expect(my_transpose(a)).to eq(a_transpose)
  end

end


describe "stock_picker" do
  it "returns an empty array if the prices array is empty" do
    expect(stock_picker([])).to eq([])
  end

  it "waits as long as possible to sell in a rising market" do
    expect(stock_picker([0, 1, 2, 3, 4, 5])).to eq([0, 5])
    expect(stock_picker([0, 2, 5, 10, 11])).to eq([0, 4])
  end

  it "waits to buy and sells immediately in uniform desc" do
    expect(stock_picker([5, 4, 3, 2, 1, 0])).to eq([4, 5])
  end

  it "minimizes losses in a declining market" do
    expect(stock_picker([100, 90, 87, 50, 10, 3])).to eq([1, 2])
  end

  it "maximizes profit and minimizes losses in a mixed market" do
    expect(stock_picker([4, 6, 1, 3])).to eq([2, 3])
    expect(stock_picker([5, 2, 1, 0, 4, 3, 7])).to eq([3, 6])
    expect(stock_picker([4, 8, 1, 3])).to eq([0, 1])
    expect(stock_picker([1, 0, 5, 0, 1])).to eq([1, 2])
  end
end
