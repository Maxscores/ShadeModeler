class Array
  attr_accessor :panel_length,
                :panel_width,
                :row_count,
                :column_count,
                :row_space,
                :column_space,
                :panels,
                :panel_tilt,
                :panel_azimuth

  def initialize(array_config)
    @panel_length = array_config[:panel_length]
    @panel_width = array_config[:panel_width]
    @panel_tilt = array_config[:panel_tilt]
    @panel_azimuth = array_config[:panel_azimuth]
    @row_count = array_config[:row_count]
    @column_count = array_config[:column_count]
    @row_space = array_config[:row_space]
    @column_space = array_config[:column_space]
    @panels = []
  end

  def generate_layout
    row_count.times do |row|
      array_row = []
      column_count.times do |col|
        panel_config = {
          x_origin: panel_width * col,
          y_origin: panel_length * row,
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

end
