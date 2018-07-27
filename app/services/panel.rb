require './app/services/util'

class Panel
  using Util
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
    Util.to_rad(azimuth)
  end

  def rad_tilt
    Util.to_rad(tilt)
  end

  def effective_length
    length * Math.cos(rad_tilt)
  end

  def corner_1
    original_x = -1 * width / 2
    original_y = -1 * effective_length / 2
    rotate_config = {
      original_x: original_x,
      original_y: original_y,
      rotation: rad_azimuth
    }

    x_coord = x_origin - Util.rotate_x_offset(rotate_config)
    y_coord = y_origin - Util.rotate_y_offset(rotate_config)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_2
    original_x = -1 * width / 2
    original_y = effective_length / 2
    rotate_config = {
      original_x: original_x,
      original_y: original_y,
      rotation: rad_azimuth
    }

    x_coord = x_origin - Util.rotate_x_offset(rotate_config)
    y_coord = y_origin - Util.rotate_y_offset(rotate_config)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_3
    original_x = width / 2
    original_y = effective_length / 2
    rotate_config = {
      original_x: original_x,
      original_y: original_y,
      rotation: rad_azimuth
    }

    x_coord = x_origin - Util.rotate_x_offset(rotate_config)
    y_coord = y_origin - Util.rotate_y_offset(rotate_config)
    [x_coord.round(2), y_coord.round(2)]
  end

  def corner_4
    original_x = width / 2
    original_y = -1 * effective_length / 2
    rotate_config = {
      original_x: original_x,
      original_y: original_y,
      rotation: rad_azimuth
    }

    x_coord = x_origin - Util.rotate_x_offset(rotate_config)
    y_coord = y_origin - Util.rotate_y_offset(rotate_config)
    [x_coord.round(2), y_coord.round(2)]
  end
end
