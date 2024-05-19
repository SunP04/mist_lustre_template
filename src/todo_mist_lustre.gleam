import components/layout/layout

import gleam/bytes_builder
import gleam/erlang/process
import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import gleam/uri
import lustre/attribute
import lustre/element
import lustre/element/html
import mist.{type Connection, type ResponseData}

pub fn main() {
  let assert Ok(_) =
    fn(req: Request(Connection)) -> Response(ResponseData) {
      case request.path_segments(req) {
        [] -> home_page(req)
        _ -> not_found_page(req)
      }
    }
    |> mist.new
    |> mist.port(3000)
    |> mist.start_http

  process.sleep_forever()
}

fn home_page(_req: Request(Connection)) -> Response(ResponseData) {
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

fn not_found_page(req: Request(Connection)) -> Response(ResponseData) {
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
