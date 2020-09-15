open! Core
open! Import

let%test_unit "zipped" =
  Accessor_test_helpers.(
    field
      (module Testable.List (Testable.Tuple (Bool) (Bool)))
      (module Testable.Tuple (Testable.List (Bool)) (Testable.List (Bool)))
      (module Unit)
      (fun () -> Accessor.List.zipped))
;;
