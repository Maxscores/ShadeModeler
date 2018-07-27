require './app/services/solar_array'

describe SolarArray do
  it "can generate a 1 x 2 layout with no spacing" do
    array = SolarArray.new({
      panel_length: 1,
      panel_width: 1,
      panel_tilt: 0,
      panel_azimuth: 180,
      array_azimuth: 0,
      row_count: 1,
      column_count: 2,
      row_space: 0,
      column_space: 0
    })

    array.generate_layout

    # tests number of rows
    expect(array.panels.count).to eq(1)
    # tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(2)

    panel_1 = array.panels[0][0]
    panel_2 = array.panels[0][1]

    expect(panel_1.x_origin).to eq(0)
    expect(panel_1.y_origin).to eq(0)
    expect(panel_2.x_origin).to eq(1)
    expect(panel_2.y_origin).to eq(0)

    expect(panel_1.corner_4).to eq(panel_2.corner_1)
    expect(panel_1.corner_3).to eq(panel_2.corner_2)
  end

  it "can generate a 1 x 2 layout with spacing" do
    array = SolarArray.new({
      panel_length: 1,
      panel_width: 1,
      panel_tilt: 0,
      panel_azimuth: 180,
      array_azimuth: 0,
      row_count: 1,
      column_count: 2,
      row_space: 1,
      column_space: 1
    })

    array.generate_layout

    # tests number of rows
    expect(array.panels.count).to eq(1)
    # tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(2)

    panel_1 = array.panels[0][0]
    panel_2 = array.panels[0][1]

    expect(panel_1.x_origin).to eq(0)
    expect(panel_1.y_origin).to eq(0)
    expect(panel_2.x_origin).to eq(2)
    expect(panel_2.y_origin).to eq(0)

    expect(panel_1.corner_4).to_not eq([panel_2.corner_1])
    expect(panel_1.corner_3).to_not eq(panel_2.corner_2)
  end

  it "can generate a 2 x 2 layout with no spacing" do
    array = SolarArray.new({
      panel_length: 1,
      panel_width: 1,
      panel_tilt: 0,
      panel_azimuth: 180,
      array_azimuth: 0,
      row_count: 2,
      column_count: 2,
      row_space: 0,
      column_space: 0
    })

    array.generate_layout

    # tests number of rows
    expect(array.panels.count).to eq(2)
    # tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(2)
    expect(array.panels[1].count).to eq(2)

    panel_1 = array.panels[0][0]
    panel_2 = array.panels[0][1]
    panel_3 = array.panels[1][0]
    panel_4 = array.panels[1][1]

    expect(panel_1.x_origin).to eq(0)
    expect(panel_1.y_origin).to eq(0)
    expect(panel_2.x_origin).to eq(1)
    expect(panel_2.y_origin).to eq(0)
    expect(panel_3.x_origin).to eq(0)
    expect(panel_3.y_origin).to eq(1)
    expect(panel_4.x_origin).to eq(1)
    expect(panel_4.y_origin).to eq(1)

    expect(panel_1.corner_2).to eq(panel_3.corner_1)
    expect(panel_1.corner_3).to eq(panel_3.corner_4)
    expect(panel_2.corner_2).to eq(panel_4.corner_1)
    expect(panel_2.corner_3).to eq(panel_4.corner_4)
  end

  it "can generate a 2 x 2 layout with spacing" do
    array = SolarArray.new({
      panel_length: 1,
      panel_width: 1,
      panel_tilt: 0,
      panel_azimuth: 180,
      array_azimuth: 0,
      row_count: 2,
      column_count: 2,
      row_space: 1,
      column_space: 1
    })

    array.generate_layout

    # tests number of rows
    expect(array.panels.count).to eq(2)



    # tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(2)
    expect(array.panels[1].count).to eq(2)

    panel_1 = array.panels[0][0]
    panel_2 = array.panels[0][1]
    panel_3 = array.panels[1][0]
    panel_4 = array.panels[1][1]

    expect(panel_1.x_origin).to eq(0)
    expect(panel_1.y_origin).to eq(0)
    expect(panel_2.x_origin).to eq(2)
    expect(panel_2.y_origin).to eq(0)
    expect(panel_3.x_origin).to eq(0)
    expect(panel_3.y_origin).to eq(2)
    expect(panel_4.x_origin).to eq(2)
    expect(panel_4.y_origin).to eq(2)

    expect(panel_1.corner_2).to_not eq(panel_3.corner_1)
    expect(panel_1.corner_3).to_not eq(panel_3.corner_4)
    expect(panel_2.corner_2).to_not eq(panel_4.corner_1)
    expect(panel_2.corner_3).to_not eq(panel_4.corner_4)
  end

  it "can generate a 1 x 3 layout at an angle" do
    array = SolarArray.new({
      panel_length: 2,
      panel_width: 2,
      panel_tilt: 0,
      panel_azimuth: 180,
      array_azimuth: 45,
      row_count: 1,
      column_count: 3,
      row_space: 1,
      column_space: 1
    })

    array.generate_layout

    # tests number of rows
    expect(array.panels.count).to eq(1)


    # tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(3)

    panel_1 = array.panels[0][0]
    panel_2 = array.panels[0][1]
    panel_3 = array.panels[0][2]

    expected_length = (3 / Math.sqrt(2))

    expect(panel_1.x_origin).to eq(0)
    expect(panel_1.y_origin).to eq(0)
    expect(panel_2.x_origin).to eq((expected_length * 1).round(2))
    expect(panel_2.y_origin).to eq((expected_length * 1).round(2))
    expect(panel_3.x_origin).to eq((expected_length * 2).round(2))
    expect(panel_3.y_origin).to eq((expected_length * 2).round(2))
  end

  it "can generate a 2 x 3 layout at an angle" do
    array = SolarArray.new({
      panel_length: 2,


      panel_width: 2,
      panel_tilt: 0,
      panel_azimuth: 180,
      array_azimuth: 45,
      row_count: 2,
      column_count: 3,
      row_space: 1,
      column_space: 1
    })

    array.generate_layout

    # tests number of rows
    expect(array.panels.count).to eq(2)


    # tests numbers of columns & panels per column
    expect(array.panels[0].count).to eq(3)
    expect(array.panels[1].count).to eq(3)

    panel_1 = array.panels[0][0]
    panel_2 = array.panels[0][1]
    panel_3 = array.panels[0][2]
    panel_4 = array.panels[1][0]
    panel_5 = array.panels[1][1]
    panel_6 = array.panels[1][2]

    expected_length = (3 / Math.sqrt(2))

    expect(panel_1.x_origin).to eq(0)
    expect(panel_1.y_origin).to eq(0)
    expect(panel_2.x_origin).to eq((expected_length * 1).round(2))
    expect(panel_2.y_origin).to eq((expected_length * 1).round(2))
    expect(panel_3.x_origin).to eq((expected_length * 2).round(2))
    expect(panel_3.y_origin).to eq((expected_length * 2).round(2))
    expect(panel_4.x_origin).to eq((expected_length * -1).round(2))
    expect(panel_4.y_origin).to eq((expected_length * 1).round(2))
    expect(panel_5.x_origin).to eq(0)
    expect(panel_5.y_origin).to eq((expected_length * 2).round(2))
    expect(panel_6.x_origin).to eq((expected_length * 1).round(2))
    expect(panel_6.y_origin).to eq((expected_length * 3).round(2))
  end
end
