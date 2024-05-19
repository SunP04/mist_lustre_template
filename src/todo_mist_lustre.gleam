import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import mist.{type Connection, type ResponseData}

import gleam/erlang/process

import pages/pages

pub fn main() {
  let assert Ok(_) =
    handle_request
    |> mist.new
    |> mist.port(3000)
    |> mist.start_http

  process.sleep_forever()
}

fn handle_request(req: Request(Connection)) -> Response(ResponseData) {
  req
  |> pages.resolve_page()
}
