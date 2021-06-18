open! Core
open! Import

type t = Day_of_week.t =
  | Sun
  | Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
[@@deriving accessors]
