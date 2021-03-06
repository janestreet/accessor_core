open! Core
open! Import
include module type of Accessor.Map

(** [at_key_set keys] is like [at key], but it accesses multiple keys. *)
val at_key_set
  :  ('key, _) Set.t
  -> (_, 'data option, ('key, 'data, _) Map.t, [< many ]) Accessor.t

(** [at_key_seti keys] is like [ati key], but it accesses multiple keys. *)
val at_key_seti
  :  ('key, _) Set.t
  -> ('key * _, 'data option, ('key, 'data, _) Map.t, [< many ]) Accessor.Indexed.t

(** [found_key_set keys] is like [found key], but it accesses multiple keys. *)
val found_key_set
  :  ('key, _) Set.t
  -> (_, 'data, ('key, 'data, _) Map.t, [< many ]) Accessor.t

(** [found_key_seti keys] is like [foundi key], but it accesses multiple keys. *)
val found_key_seti
  :  ('key, _) Set.t
  -> ('key * _, 'data, ('key, 'data, _) Map.t, [< many ]) Accessor.Indexed.t
