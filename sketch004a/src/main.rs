use nannou::prelude::*;

fn main() {
    nannou::app(model).update(update).run();
}

struct Model {
    _window: window::Id,
}

fn model(app: &App) -> Model {
    let _window = app.new_window().size(500, 300).view(view).build().unwrap();
    Model { _window }
}

fn update(_app: &App, _model: &mut Model, _update: Update) {}

fn view(app: &App, _model: &Model, frame: Frame) {
    let draw = app.draw();
    draw.background().color(GREY);

    for i in 0..20 {
        draw.ellipse()
            .x_y(i as f32 * 10.0 + 20.0, 40.0)
            .w(10.0)
            .h(10.0)
            .color(WHITE)
            .stroke(BLACK)
            .stroke_weight(1.0);
    }

    draw.to_frame(app, &frame).unwrap();
}
