use nannou::prelude::*;

fn main() {
    nannou::app(model).update(update).run();
}

struct Model {
    _window: window::Id,
}

fn model(app: &App) -> Model {
    let _window = app.new_window().size(400, 300).view(view).build().unwrap();
    Model { _window }
}

fn update(_app: &App, _model: &mut Model, _update: Update) {}

fn view(app: &App, _model: &Model, frame: Frame) {
    let draw = app.draw();
    draw.background().color(WHITE);
    draw.ellipse()
        .x_y(-100.0, 0.0)
        .w(100.0)
        .h(50.0)
        .color(BLACK)
        .stroke(BLACK)
        .stroke_weight(1.0);;
    draw.ellipse()
        .x_y(100.0, 0.0)
        .w(50.0)
        .h(100.0)
        .color(BLACK)
        .stroke(BLACK)
        .stroke_weight(1.0);;
    draw.to_frame(app, &frame).unwrap();
}
