open! Core
open! Import

module Bool_fdeque = struct
  type t = bool Fdeque.t [@@deriving equal, sexp_of]

  let quickcheck_generator =
    Quickcheck.Generator.map [%quickcheck.generator: bool list] ~f:Fdeque.of_list
  ;;

  let quickcheck_shrinker =
    Quickcheck.Shrinker.map
      [%quickcheck.shrinker: bool list]
      ~f:Fdeque.of_list
      ~f_inverse:Fdeque.to_list
  ;;

  let quickcheck_observer =
    Quickcheck.Observer.unmap [%quickcheck.observer: bool list] ~f:Fdeque.to_list
  ;;
end

let%test_unit "empty" =
  Accessor_test_helpers.variant
    (module Unit)
    (module Bool_fdeque)
    (module Unit)
    (fun () -> Accessor.Fdeque.empty)
;;

let%test_unit "front" =
  Accessor_test_helpers.variant
    (module Accessor_test_helpers.Testable.Tuple (Bool) (Bool_fdeque))
    (module Bool_fdeque)
    (module Unit)
    (fun () -> Accessor.Fdeque.front)
;;

let%test_unit "back" =
  Accessor_test_helpers.variant
    (module Accessor_test_helpers.Testable.Tuple (Bool_fdeque) (Bool))
    (module Bool_fdeque)
    (module Unit)
    (fun () -> Accessor.Fdeque.back)
;;

let%test_unit "first" =
  Accessor_test_helpers.optional
    (module Bool)
    (module Bool_fdeque)
    (module Unit)
    (fun () -> Accessor.Fdeque.first)
;;

let%test_unit "last" =
  Accessor_test_helpers.optional
    (module Bool)
    (module Bool_fdeque)
    (module Unit)
    (fun () -> Accessor.Fdeque.last)
;;

let%test_unit "reversed" =
  Accessor_test_helpers.isomorphism
    (module Bool_fdeque)
    (module Bool_fdeque)
    (module Unit)
    (fun () -> Accessor.Fdeque.reversed)
;;

let%test_unit "each" =
  Accessor_test_helpers.many (module Bool) (module Bool_fdeque) (module Unit) (fun () ->
    Accessor.Fdeque.each)
;;
