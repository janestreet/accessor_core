open! Core
open! Import

module Float = struct
  include Float

  let equal x y = Int.equal (compare x y) 0
end

let%test_unit "mult" =
  Accessor_test_helpers.isomorphism
    (module Float)
    (module Percent)
    (module Unit)
    (fun () -> Accessor.Percent.mult)
;;
