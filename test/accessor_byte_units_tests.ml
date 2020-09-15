open! Core
open! Import

module Byte_units = struct
  include Byte_units

  let quickcheck_generator =
    Quickcheck.Generator.map (Int.gen_incl 0 Int.max_value) ~f:Byte_units.of_bytes_int
  ;;

  let quickcheck_shrinker =
    Quickcheck.Shrinker.map
      [%quickcheck.shrinker: int]
      ~f:Byte_units.of_bytes_int
      ~f_inverse:Byte_units.bytes_int_exn
  ;;

  let quickcheck_observer =
    Quickcheck.Observer.unmap [%quickcheck.observer: int] ~f:Byte_units.bytes_int_exn
  ;;
end

let%test_unit "bytes" =
  Accessor_test_helpers.isomorphism
    (module Int)
    (module Byte_units)
    (module Unit)
    (fun () -> Accessor.Byte_units.bytes)
;;
