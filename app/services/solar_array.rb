require './app/services/util'

class SolarArray
  using Util
  attr_accessor :panel_length,
                :panel_width,
                :row_count,
                :column_count,
                :row_space,
                :column_space,
                :panels,
                :panel_tilt,
                :panel_azimuth,
                :array_azimuth

  def initialize(array_config)
    @panel_length = array_config[:panel_length]
    @panel_width = array_config[:panel_width]
    @panel_tilt = array_config[:panel_tilt]
    @panel_azimuth = array_config[:panel_azimuth]
    @array_azimuth = array_config[:array_azimuth]
    @row_count = array_config[:row_count]
    @column_count = array_config[:column_count]
    @row_space = array_config[:row_space]
    @column_space = array_config[:column_space]
    @panels = []
  end

  def rad_array_azimuth
    Util.to_rad(array_azimuth)
  end

  def generate_layout
    starting_grid.each do |row|
      row.each do |panel|
        original_x = panel.x_origin
        original_y = panel.y_origin
        rotate_config = {
          original_x: original_x,
          original_y: original_y,
          rotation: rad_array_azimuth
        }

        panel.x_origin = Util.rotate_x_offset(rotate_config)
        panel.y_origin = Util.rotate_y_offset(rotate_config)
      end
    end
  end

  def starting_grid
    row_count.times do |row|
      array_row = []
      column_count.times do |col|
        panel_config = {
          x_origin: (panel_width + column_space ) * col,
          y_origin: (panel_length + row_space) * row,
          width: panel_width,
          length: panel_length,
          tilt: panel_tilt,
          azimuth: panel_azimuth
        }
        array_row << Panel.new(panel_config)
      end
      panels << array_row
    end
    panels
  end

  def rotate_layout(grid)

  end

  def set_y_adjust(deg, row, col)
    if deg % 180 == 0
      row + 1
    else
      row + col + 1
    end

  end

end
