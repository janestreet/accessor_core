open! Core
open! Import

module Bool_fqueue = struct
  type t = bool Fqueue.t [@@deriving equal, sexp_of]

  let quickcheck_generator =
    Quickcheck.Generator.map [%quickcheck.generator: bool list] ~f:Fqueue.of_list
  ;;

  let quickcheck_shrinker =
    Quickcheck.Shrinker.map
      [%quickcheck.shrinker: bool list]
      ~f:Fqueue.of_list
      ~f_inverse:Fqueue.to_list
  ;;

  let quickcheck_observer =
    Quickcheck.Observer.unmap [%quickcheck.observer: bool list] ~f:Fqueue.to_list
  ;;
end

let%test_unit "empty" =
  Accessor_test_helpers.variant
    (module Unit)
    (module Bool_fqueue)
    (module Unit)
    (fun () -> Accessor.Fqueue.empty)
;;

let%test_unit "each" =
  Accessor_test_helpers.many (module Bool) (module Bool_fqueue) (module Unit) (fun () ->
    Accessor.Fqueue.each)
;;
