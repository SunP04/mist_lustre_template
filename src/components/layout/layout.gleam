import components/layout/base
import components/layout/header
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn layout(title: String, children: List(Element(a))) -> Element(a) {
  base.html(title, [
    header.header(),
    html.main(
      [
        attribute.class(
          "w-full h-full min-h-[90svh] my-1 py-2 flex flex-col items-center gap-3 bg-neutral text-neutral-content",
        ),
      ],
      [
        html.div(
          [
            attribute.class(
              "w-[125svh] h-full mb-5 flex flex-col flex-wrap items-center gap-1",
            ),
            attribute.id("main-content"),
          ],
          children,
        ),
      ],
    ),
  ])
}
