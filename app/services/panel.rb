class Panel
  attr_accessor :x_origin, :y_origin, :width, :length, :tilt, :azimuth

  def initialize(panel_config)
    @x_origin = panel_config[:x_origin]
    @y_origin = panel_config[:y_origin]
    @width = panel_config[:width]
    @length = panel_config[:length]
    @tilt = panel_config[:tilt]
    @azimuth = panel_config[:azimuth]
  end

  def rad_azimuth
    azimuth * Math::PI / 180
  end

  def rad_tilt
    tilt * Math::PI / 180
  end

  def effective_length
    length * Math.cos(rad_tilt)
  end

  def corner_1
    original_x = -1 * width / 2
    original_y = -1 * effective_length / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_2
    original_x = -1 * width / 2
    original_y = effective_length / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_3
    original_x = width / 2
    original_y = effective_length / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_4
    original_x = width / 2
    original_y = -1 * effective_length / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def x_offset(original_x, original_y)
    (original_x * Math.cos(rad_azimuth)) - (original_y * Math.sin(rad_azimuth))
  end

  def y_offset(original_x, original_y)
    (original_x * Math.sin(rad_azimuth)) + (original_y * Math.cos(rad_azimuth))
  end

end
