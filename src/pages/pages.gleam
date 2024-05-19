import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import mist.{type Connection, type ResponseData}

import pages/home
import pages/not_found

pub fn resolve_page(req: Request(Connection)) -> Response(ResponseData) {
  case request.path_segments(req) {
    [] -> home.home(req)
    _ -> not_found.not_found(req)
  }
}
