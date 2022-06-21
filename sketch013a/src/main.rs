use nannou::prelude::*;

fn main() {
    nannou::app(model).run();
}

struct Model {
    texture: wgpu::Texture,
}

fn model(app: &App) -> Model {
    app.new_window().size(640, 480).view(view).build().unwrap();
    let img_path = "data/image.jpg";
    let texture = wgpu::Texture::from_path(app, img_path).unwrap();
    Model { texture }
}

fn view(app: &App, model: &Model, frame: Frame) {
    frame.clear(BLACK);

    let draw = app.draw();
    let win = app.window_rect();

    draw.texture(&model.texture).x_y(win.top_left().x, win.top_left().y);

    draw.to_frame(app, &frame).unwrap();
}