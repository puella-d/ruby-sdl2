require "sdl2"

SDL2.init(SDL2::INIT_EVERYTHING)

window = SDL2::Window.create("testsprite",
                             SDL2::Window::OP_CENTERED, SDL2::Window::OP_CENTERED,
                             640, 480, 0)
renderer = window.create_renderer(-1, 0)
texture = renderer.load_texture("icon.bmp")

rect = SDL2::Rect.new(48, 128, 32, 32)
p SDL2::Renderer.drivers_info
p renderer.info
renderer.copy(texture, nil, rect)
renderer.present

loop do
  while ev = SDL2::Event.poll
    case ev
    when SDL2::Event::KeyDown
      if ev.scancode == SDL2::Key::Scan::ESCAPE
        exit
      else
        p ev.scancode
      end
    end
  end

  sleep 0.1
end

