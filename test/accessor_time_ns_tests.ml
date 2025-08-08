open! Core
open! Import

let%test_unit "span_since_epoch" =
  Accessor_test_helpers.isomorphism
    (module Time_ns.Span)
    (module Time_ns)
    (module Unit)
    (fun () -> Accessor.Time_ns.span_since_epoch)
;;

module Canonical_ofday = struct
  include Time_ns.Ofday

  let quickcheck_generator =
    Quickcheck.Generator.filter [%quickcheck.generator: t] ~f:(fun t ->
      not (Time_ns.Ofday.equal t Time_ns.Ofday.start_of_next_day))
  ;;
end

(* We only use the UTC zone in order to avoid time shifts, because we already know the
   accessors are not well behaved in the presence of time shifts. *)

let%test_unit "date_ofday" =
  Accessor_test_helpers.isomorphism
    (module Accessor_test_helpers.Testable.Tuple (Date) (Canonical_ofday))
    (module Time_ns)
    (module Unit)
    (fun () -> Accessor.Time_ns.date_ofday Time.Zone.utc)
;;

let%test_unit "date" =
  Accessor_test_helpers.field (module Date) (module Time_ns) (module Unit) (fun () ->
    Accessor.Time_ns.date Time.Zone.utc)
;;
