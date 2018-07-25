require './app/services/array'

describe Array do
  it "can generate a 1 x 2 layout with no spacing" do
    array = Array.new({
      panel_length: 1,
      panel_width: 1,
      panel_tilt: 0,
      panel_azimuth: 180,
      row_count: 1,
      column_count: 2,
      row_space: 1,
      column_space: 0
    })

    array.generate_layout

# tests number of rows
    expect(array.panels.count).to eq(1)
# tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(2)
    expect(array.panels[0][0].x_origin).to eq(0)
    expect(array.panels[0][0].y_origin).to eq(0)
    expect(array.panels[0][1].x_origin).to eq(1)
    expect(array.panels[0][1].y_origin).to eq(0)
  end
end
