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

    draw.texture(&model.texture);

    draw.to_frame(app, &frame).unwrap();
}