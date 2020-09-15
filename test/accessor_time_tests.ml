open! Core
open! Import

let%test_unit "span_since_epoch" =
  Accessor_test_helpers.isomorphism
    (module Time.Span)
    (module Time)
    (module Unit)
    (fun () -> Accessor.Time.span_since_epoch)
;;
