open! Core
open! Import

module Month = struct
  type t = Month.t =
    | Jan
    | Feb
    | Mar
    | Apr
    | May
    | Jun
    | Jul
    | Aug
    | Sep
    | Oct
    | Nov
    | Dec
  [@@deriving quickcheck]

  include (Month : module type of Month with type t := Month.t)
end

module Reasonable_shift = struct
  type t = int [@@deriving quickcheck, sexp_of]

  let quickcheck_generator = Int.gen_incl (Int.min_value + 12) (Int.max_value - 12)
end

let%test_unit "shifted" =
  Accessor_test_helpers.isomorphism
    (module Month)
    (module Month)
    (module Reasonable_shift)
    Accessor.Month.shifted
;;
