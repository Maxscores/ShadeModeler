require './app/services/panel'

describe Panel do
  it "can return the coordinates of its corners with horizontal azimuth" do
    panel = Panel.new(0,0,2,4,0,180)

    expect(panel.corner_1).to eq([-1, -2])
    expect(panel.corner_2).to eq([-1, 2])
    expect(panel.corner_3).to eq([1, 2])
    expect(panel.corner_4).to eq([1, -2])
  end

  it "can return the coordinates of its square corners rotated" do
    panel = Panel.new(0,0,2,2,0,135)

    expected_length = (Math.sqrt(8) / 2).round(2)

    expect(panel.corner_1).to eq([-1 * expected_length, 0])
    expect(panel.corner_2).to eq([0, expected_length])
    expect(panel.corner_3).to eq([expected_length, 0])
    expect(panel.corner_4).to eq([0, -1 * expected_length])
  end

  it "can return the coordinates of rectangle corners rotated" do
    panel = Panel.new(0,0,2,4,0,135)

    expected_length = Math.sqrt(8) / 2

    expect_c1 = [(-1.5 * expected_length).round(2), (-0.5 * expected_length).round(2)]
    expect_c2 = [(0.5 * expected_length).round(2), (1.5 * expected_length).round(2)]
    expect_c3 = [(1.5 * expected_length).round(2), (0.5 * expected_length).round(2)]
    expect_c4 = [(-0.5 * expected_length).round(2), (-1.5 * expected_length).round(2)]

    expect(panel.corner_1).to eq(expect_c1)
    expect(panel.corner_2).to eq(expect_c2)
    expect(panel.corner_3).to eq(expect_c3)
    expect(panel.corner_4).to eq(expect_c4)
  end

  it "can return the coordinates of its corners with panel tilt" do
    panel = Panel.new(0,0,2,4,30,180)

    expect(panel.corner_1).to eq([-1, -1.73])
    expect(panel.corner_2).to eq([-1, 1.73])
    expect(panel.corner_3).to eq([1, 1.73])
    expect(panel.corner_4).to eq([1, -1.73])
  end
end
