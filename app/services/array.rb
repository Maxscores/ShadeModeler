require './app/services/util'

class Array
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
    row_count.times do |row|
      array_row = []
      column_count.times do |col|
        panel_config = {
          x_origin: (x_offset * (col + 1)).round(2),
          y_origin: (y_offset * (row + 1)).round(2),
          width: panel_width,
          length: panel_length,
          tilt: panel_tilt,
          azimuth: panel_azimuth
        }
        array_row << Panel.new(panel_config)
      end
      panels << array_row
    end
  end

  def x_offset
    (panel_width + column_space) * Math.sin(rad_array_azimuth - Math::PI / 2)
  end

  def y_offset
    (panel_length + row_space) * Math.cos(rad_array_azimuth - Math::PI)
  end

  def set_y_adjust(deg, row, col)
    if deg % 180 == 0
      row + 1
    else
      row + col + 1
    end

  end

end
