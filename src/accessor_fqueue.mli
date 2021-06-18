open! Core
open! Import

(** Access [()] iff the queue is empty. *)
val empty : (_, unit, 'a Fqueue.t, [< variant ]) Accessor.t

(** Access each element of the queue. *)
val each
  : ('i -> 'a -> 'b, 'i -> 'a Fqueue.t -> 'b Fqueue.t, [< many ]) Accessor.General.t

(** The indexed version of [each] provides a numeric index for each element. *)
val eachi
  : (int * 'i -> 'a -> 'b, 'i -> 'a Fqueue.t -> 'b Fqueue.t, [< many ]) Accessor.General.t

include Accessor.Monad.S with type 'a t := 'a Fqueue.t
