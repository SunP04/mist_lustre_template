import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn html(title: String, children: List(Element(a))) -> Element(a) {
  let title = "Lumen - " <> title

  html.html(
    [
      attribute.attribute("data-theme", "luxury"),
      attribute.attribute("lang", "pt-BR"),
      attribute.class("h-screen w-screen overflow-x-hidden"),
    ],
    [
      html.head([], [
        html.title([], title),
        html.meta([
          attribute.attribute("property", "og:title"),
          attribute.attribute("content", title),
        ]),
        html.meta([
          attribute.name("viewport"),
          attribute.attribute(
            "content",
            "width=device-width, initial-scale=1.0",
          ),
        ]),
        html.meta([attribute.attribute("charset", "UTF-8")]),
        html.script(
          [
            attribute.src(
              "https://cdn.jsdelivr.net/npm/theme-change@2.0.2/index.js",
            ),
          ],
          "",
        ),
        html.script([attribute.src("https://cdn.tailwindcss.com")], ""),
        html.link([
          attribute.href(
            "https://cdn.jsdelivr.net/npm/daisyui@4.10.2/dist/full.min.css",
          ),
          attribute.rel("stylesheet"),
          attribute.type_("text/css"),
        ]),
        html.script(
          [
            attribute.src("https://unpkg.com/htmx.org@1.9.12"),
            attribute.attribute(
              "integrity",
              "sha384-ujb1lZYygJmzgSwoxRggbCHcjc0rB2XoQrxeTUQyRjrOnlCoYta87iKBWq3EsdM2",
            ),
            attribute.attribute("crossorigin", "anonymous"),
          ],
          "",
        ),
        html.script(
          [],
          "tailwind.config = {
            daisyui: {
              base: true,
              styled: true,
              themes: [
                \"coffee\",
                \"dracula\",
                \"black\",
                \"sunset\",
                \"luxury\",

                \"cupcake\",
                \"halloween\",
                \"lemonade\",
                \"aqua\",

                \"cyberpunk\",
                \"synthwave\",
              ],
            },
          };",
        ),
      ]),
      html.body(
        [attribute.class("h-full w-full bg-neutral text-neutral-content")],
        children,
      ),
    ],
  )
}
