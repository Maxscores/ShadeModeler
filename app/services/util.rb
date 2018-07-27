module Util
  def self.to_rad(angle)
    angle * Math::PI / 180
  end

  def self.rotate_x_offset(config)
    original_x = config[:original_x]
    original_y = config[:original_y]
    rotation = config[:rotation]
    x_offset = (original_x * Math.cos(rotation)) - (original_y * Math.sin(rotation))
    x_offset.round(2)
  end

  def self.rotate_y_offset(config)
    original_x = config[:original_x]
    original_y = config[:original_y]
    rotation = config[:rotation]
    y_offset = (original_x * Math.sin(rotation)) + (original_y * Math.cos(rotation))
    y_offset.round(2)
  end
end
