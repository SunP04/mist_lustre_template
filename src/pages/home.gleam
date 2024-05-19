import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import mist.{type Connection, type ResponseData}

import gleam/bytes_builder

import components/layout/layout
import lustre/attribute
import lustre/element
import lustre/element/html

pub fn home(_req: Request(Connection)) -> Response(ResponseData) {
  let res = response.new(200)
  let html =
    layout.layout("Home", [
      html.h1(
        [
          attribute.class(
            "text-red-500 transition-colors duration-700 hover:text-green-500",
          ),
        ],
        [html.text("Hello, world!")],
      ),
      html.h2(
        [
          attribute.class(
            "text-blue-500 transition-colors hover:text-green-500",
          ),
        ],
        [html.text("You're in the home page!")],
      ),
    ])

  response.set_body(
    res,
    html
      |> element.to_document_string
      |> bytes_builder.from_string
      |> mist.Bytes,
  )
}
