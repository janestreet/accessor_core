open! Core
open! Import

module Positive_int = struct
  include Int

  let quickcheck_generator = Int.gen_log_incl 1 Int.max_value
end

module Pid = struct
  include Pid

  include
    Quickcheckable.Of_quickcheckable
      (Positive_int)
      (struct
        include Pid

        let to_quickcheckable = to_int
        let of_quickcheckable = of_int
      end)
end

let%test_unit "int" =
  Accessor_test_helpers.isomorphism
    (module Positive_int)
    (module Pid)
    (module Unit)
    (fun () -> Accessor.Pid.int)
;;
