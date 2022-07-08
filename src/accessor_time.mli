open! Core
open! Import

(** Access the time as a span since [Time.epoch] *)
val span_since_epoch : (_, Time_float.Span.t, Time_float.t, [< isomorphism ]) Accessor.t

(** [date_ofday], [date] and [ofday] present a time as a [Date.t * Time.Ofday.t]. They are
    not well behaved accessors in general, but especially during time shifts (e.g. when
    transitioning to or from daylight savings time). See the explanation of
    well-behaveness in the [Accessor] documentation. *)

val date_ofday
  :  Time_float.Zone.t
  -> (_, Date.t * Time_float.Ofday.t, Time_float.t, [< isomorphism ]) Accessor.t

val date : Time_float.Zone.t -> (_, Date.t, Time_float.t, [< field ]) Accessor.t

val ofday
  :  Time_float.Zone.t
  -> (_, Time_float.Ofday.t, Time_float.t, [< field ]) Accessor.t

module Span : sig
  (** Access a span as various units. *)

  val ns : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
  val us : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
  val ms : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
  val sec : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
  val min : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
  val hr : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
  val day : (_, float, Time_float.Span.t, [< isomorphism ]) Accessor.t
end
