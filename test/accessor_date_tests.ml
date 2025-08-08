open! Core
open! Import

(* It's a bit sad that we aren't testing with leap days and some other edge cases (the
   last days of most months), but it isn't clear how to do it without complicating the
   tests quite a bit. *)

module Date = struct
  include Date

  let quickcheck_generator =
    Quickcheck.Generator.filter quickcheck_generator ~f:(fun date ->
      Int.( <= ) (Date.day date) 28)
  ;;
end

module Year = struct
  type t = int [@@deriving equal, sexp_of, quickcheck]

  let quickcheck_generator = Int.gen_incl 1900 2100
end

module Day = struct
  type t = int [@@deriving equal, sexp_of, quickcheck]

  let quickcheck_generator = Int.gen_incl 1 28
end

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

  include (
    Month :
      module type of struct
        include Month
      end
      with type t := Month.t)
end

let%test_unit "year_exn" =
  Accessor_test_helpers.field (module Year) (module Date) (module Unit) (fun () ->
    Accessor.Date.year_exn)
;;

let%test_unit "month_exn" =
  Accessor_test_helpers.field (module Month) (module Date) (module Unit) (fun () ->
    Accessor.Date.month_exn)
;;

let%test_unit "day_exn" =
  Accessor_test_helpers.field (module Day) (module Date) (module Unit) (fun () ->
    Accessor.Date.day_exn)
;;
