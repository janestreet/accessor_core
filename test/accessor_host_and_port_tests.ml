open! Core
open! Import

module Host_and_port = struct
  type t = Host_and_port.t =
    { host : string
    ; port : int
    }
  [@@deriving quickcheck]

  include (
    Host_and_port :
      module type of struct
        include Host_and_port
      end
      with type t := Host_and_port.t)
end

let%test_unit "tuple" =
  Accessor_test_helpers.variant
    (module Accessor_test_helpers.Testable.Tuple (String) (Int))
    (module Host_and_port)
    (module Unit)
    (fun () -> Accessor.Host_and_port.tuple)
;;
