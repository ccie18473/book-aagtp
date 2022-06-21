use nannou::prelude::*;

fn main() {
    nannou::app(model).update(update).run();
}

struct Model {
    _window: window::Id,
}

fn model(app: &App) -> Model {
    let _window = app.new_window().size(500, 500).view(view).build().unwrap();
    Model { _window }
}

fn update(_app: &App, _model: &mut Model, _update: Update) {
    //println!("update");
}

fn view(app: &App, _model: &Model, frame: Frame) {
    //println!("view");
    let draw = app.draw();
    let win = app.window_rect();
    let start = Point2::new(20.0, 0.0);
    let end = Point2::new(20.0, win.h());

    draw.background().rgb(0.86, 0.86, 0.86);

    draw.line()
        .weight(1.0)
        .rgb8(255, 0, 0)
        .points(start, end);

    for i in 4..50 {
        let start = Point2::new(0.0, i as f32 * 10.0);
        let end = Point2::new(win.w(), i as f32 * 10.0);

        draw.line()
        .weight(1.0)
        .rgb8(100, 0, 250)
        .points(start, end);
    }
    draw.to_frame(app, &frame).unwrap();
}
/*

  stroke (255, 0, 0); // Red margin line
  line (20, 0, 20, height);

  stroke (100, 0, 250); // Blue horizontal lines
  for (int i=4; i<50; i++)
    line (0, i*10, width, i*10);
*/
