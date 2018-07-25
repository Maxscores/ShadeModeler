class Panel
  attr_accessor :x_origin, :y_origin, :width, :height, :tilt, :azimuth

  def initialize(x_origin, y_origin, width, height, tilt, azimuth)
    @x_origin = x_origin
    @y_origin = y_origin
    @width = width
    @height = height
    @tilt = tilt
    @azimuth = azimuth
  end

  def rad_azimuth
    azimuth * Math::PI / 180
  end

  def rad_tilt
    tilt * Math::PI / 180
  end

  def corner_1
    original_x = -1 * width / 2
    original_y = -1 * height / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_2
    original_x = -1 * width / 2
    original_y = height / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_3
    original_x = width / 2
    original_y = height / 2

    x_coord = x_origin - x_offset(original_x, original_y)
    y_coord = y_origin - y_offset(original_x, original_y)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_4
    original_x = width / 2
    original_y = -1 * height / 2

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
