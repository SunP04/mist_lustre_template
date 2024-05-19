import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn header() -> Element(a) {
  html.header(
    [
      attribute.class(
        "w-full bg-primary text-neutral px-56 flex flex-row justify-between items-center",
      ),
    ],
    [
      html.h1(
        [
          attribute.class(
            "font-bold text-2xl transition-all duration-700 hover:text-3xl",
          ),
        ],
        [html.text("Lumen")],
      ),
      html.label(
        [
          attribute.for("theme-selector"),
          attribute.class("form-control py-0.5"),
        ],
        [
          html.div([attribute.class("label py-1")], [
            html.span(
              [attribute.class("label-text text-accent-content text-xs")],
              [html.text("Theme:")],
            ),
          ]),
          html.select(
            [
              attribute.attribute("data-choose-theme", "true"),
              attribute.name("theme-selector"),
              attribute.id("theme-selector"),
              attribute.class(
                "select select-xs select-bordered bg-neutral text-neutral-content",
              ),
            ],
            [
              html.option([attribute.value("cyberpunk")], "Cyberpunk"),
              html.option([attribute.value("synthwave")], "Synthwave"),
              html.option([attribute.value("sunset")], "Sunset"),
              html.option([attribute.value("black")], "Black"),
              html.option([attribute.value("coffee")], "Coffee"),
              html.option([attribute.value("luxury")], "Luxury"),
              html.option([attribute.value("dracula")], "Dracula"),
              html.option([attribute.value("cupcake")], "Cupcake"),
              html.option([attribute.value("halloween")], "Halloween"),
              html.option([attribute.value("lemonade")], "Lemonade"),
              html.option([attribute.value("aqua")], "Aqua"),
            ],
          ),
        ],
      ),
    ],
  )
}
