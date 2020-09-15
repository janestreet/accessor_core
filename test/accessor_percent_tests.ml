open! Core
open! Import

let%test_unit "mult" =
  Accessor_test_helpers.isomorphism
    (module Float)
    (module Percent)
    (module Unit)
    (fun () -> Accessor.Percent.mult)
;;
