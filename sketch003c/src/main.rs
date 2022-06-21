use nannou::prelude::*;

fn main() {
    nannou::app(model).update(update).run();
}

struct Model {
    _window: window::Id,
    count: i32,
}

fn model(app: &App) -> Model {
    let _window = app.new_window().size(300, 300).view(view).build().unwrap();
    let count = 0;
    Model { _window, count }
}

fn update(_app: &App, model: &mut Model, _update: Update) {
    if model.count == 0 {
        model.count = 1;
    } else {
        model.count = 0;
    }
}

fn view(app: &App, model: &Model, frame: Frame) {
    let draw = app.draw();

    if model.count == 0 {
        draw.background().rgb(1.0, 0.0, 0.0);
    } else {
        draw.background().rgb(0.0, 1.0, 0.0);
    }

    draw.to_frame(app, &frame).unwrap();
}
