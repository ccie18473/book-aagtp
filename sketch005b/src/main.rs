use nannou::prelude::*;

fn main() {
    nannou::app(model).update(update).run();
}

struct Model {
    _window: window::Id,
    start: Point2,
    end: Point2,
}

fn model(app: &App) -> Model {
    let _window = app.new_window()
    .size(300, 300)
    .mouse_pressed(mouse_pressed)
    .mouse_released(mouse_released)
    .view(view)
    .build()
    .unwrap();
    let start = Point2::new(0.0,0.0);
    let end = Point2::new(0.0,0.0);

    Model { _window, start, end }
}

fn update(_app: &App, _model: &mut Model, _update: Update) {
    //println!("update");
}

fn view(app: &App, model: &Model, frame: Frame) {
    //println!("view");
    let draw = app.draw();

    draw.background().rgb(200.0/255.0, 200.0/255.0, 200.0/255.0);

    draw.line()
        .weight(1.0)
        .rgb8(255, 0, 0)
        .points(model.start, model.end);

    draw.to_frame(app, &frame).unwrap();
}

fn mouse_pressed(app: &App, model: &mut Model, _button: MouseButton) {
    model.start = app.mouse.position();
    model.end = app.mouse.position();
}

fn mouse_released(app: &App, model: &mut Model, _button: MouseButton) {
    model.end = app.mouse.position();
}