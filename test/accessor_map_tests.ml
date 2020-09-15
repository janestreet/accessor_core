open! Core
open! Import
module Bool_set = Accessor_test_helpers.Testable.Bool_set
module Bool_option = Accessor_test_helpers.Testable.Option (Bool)
module Bool_bool_map = Accessor_test_helpers.Testable.Bool_map (Bool)

let%test_unit "at_key_set" =
  Accessor_test_helpers.many
    (module Bool_option)
    (module Bool_bool_map)
    (module Bool_set)
    Accessor.Map.at_key_set
;;

let%test_unit "found_key_set" =
  Accessor_test_helpers.many
    (module Bool)
    (module Bool_bool_map)
    (module Bool_set)
    Accessor.Map.found_key_set
;;
