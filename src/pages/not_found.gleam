import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import mist.{type Connection, type ResponseData}

import gleam/bytes_builder
import gleam/uri

import components/layout/layout
import lustre/attribute
import lustre/element
import lustre/element/html

pub fn not_found(req: Request(Connection)) -> Response(ResponseData) {
  let page =
    req
    |> request.to_uri
    |> fn(uri: uri.Uri) { uri.path }

  let res = response.new(404)
  let html =
    layout.layout("Home", [
      html.section(
        [
          attribute.class(
            "w-full h-full flex flex-col gap-2 items-center justify-center align-center",
          ),
        ],
        [
          html.h1([attribute.class("text-3xl text-error font-bold")], [
            html.text("Page Not Found"),
          ]),
          html.h2([attribute.class("text-xl italic text-error")], [
            html.text("The route " <> page <> " was not found."),
          ]),
        ],
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
