open! Core
open! Import

let span_since_epoch =
  [%accessor
    Accessor.isomorphism
      ~get:Time_float.to_span_since_epoch
      ~construct:Time_float.of_span_since_epoch]
;;

let date_ofday zone =
  Accessor.isomorphism
    ~get:(Time_float.to_date_ofday ~zone)
    ~construct:(fun (date, ofday) -> Time_float.of_date_ofday date ofday ~zone)
;;

let date zone = date_ofday zone @> Accessor.Tuple2.fst
let ofday zone = date_ofday zone @> Accessor.Tuple2.snd

module Span = struct
  let ns =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_ns ~construct:Time_float.Span.of_ns]
  ;;

  let us =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_us ~construct:Time_float.Span.of_us]
  ;;

  let ms =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_ms ~construct:Time_float.Span.of_ms]
  ;;

  let sec =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_sec ~construct:Time_float.Span.of_sec]
  ;;

  let min =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_min ~construct:Time_float.Span.of_min]
  ;;

  let hr =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_hr ~construct:Time_float.Span.of_hr]
  ;;

  let day =
    [%accessor
      Accessor.isomorphism ~get:Time_float.Span.to_day ~construct:Time_float.Span.of_day]
  ;;
end
