require '../lib/gosu'

Blob = Struct.new(:columns, :rows, :to_blob)

class ImageInsert < Gosu::Window
  def initialize
    super 800, 600, false
    @background = Gosu::Image.new(self, "media/Wallpaper.png", true)
    @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
    @cursor_blob = Blob.new(@cursor.width, @cursor.height, @cursor.to_blob)
  end
  
  def needs_cursor?
    false
  end
  
  def draw
    draw_quad 0, 0, Gosu::Color::RED, width, 0, Gosu::Color::RED,
      0, height, Gosu::Color::RED, width, height, Gosu::Color::RED, 0
    @background.draw 10, 10, 0
    @cursor.draw mouse_x, mouse_y, 0
  end
  
  def button_down id
    @background.insert @cursor_blob, mouse_x.to_i - 10, mouse_y.to_i - 10 if id == Gosu::MsLeft
  end
end

ImageInsert.new.show
