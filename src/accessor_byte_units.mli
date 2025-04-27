open! Core
open! Import

(** All of these accessors will raise if a bounds check fails. The expected bounds are
    documented next to the corresponding conversion functions in [Core.Byte_units]. *)

val bytes : (_, int, Byte_units.t, [< isomorphism ]) Accessor.t

(** Due to the way floating point is being used, the below accessors aren't quite perfect
    isomorphisms. *)

val kilobytes : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
val megabytes : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
val gigabytes : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
val terabytes : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
val petabytes : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
val exabytes : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
val words : (_, float, Byte_units.t, [< isomorphism ]) Accessor.t
