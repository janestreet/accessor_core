open! Core
open! Import

(** Access a pid as an int. *)
val int : (_, int, Pid.t, [< isomorphism ]) Accessor.t
