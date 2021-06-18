open! Core
open! Import

let span_since_epoch =
  [%accessor
    Accessor.isomorphism
      ~get:Time_ns.to_span_since_epoch
      ~construct:Time_ns.of_span_since_epoch]
;;

let date_ofday zone =
  Accessor.isomorphism ~get:(Time_ns.to_date_ofday ~zone) ~construct:(fun (date, ofday) ->
    Time_ns.of_date_ofday date ofday ~zone)
;;

let date zone = date_ofday zone @> Accessor.Tuple2.fst
let ofday zone = date_ofday zone @> Accessor.Tuple2.snd

module Span = struct
  let ns =
    [%accessor Accessor.isomorphism ~get:Time_ns.Span.to_ns ~construct:Time_ns.Span.of_ns]
  ;;

  let us =
    [%accessor Accessor.isomorphism ~get:Time_ns.Span.to_us ~construct:Time_ns.Span.of_us]
  ;;

  let ms =
    [%accessor Accessor.isomorphism ~get:Time_ns.Span.to_ms ~construct:Time_ns.Span.of_ms]
  ;;

  let sec =
    [%accessor
      Accessor.isomorphism ~get:Time_ns.Span.to_sec ~construct:Time_ns.Span.of_sec]
  ;;

  let min =
    [%accessor
      Accessor.isomorphism ~get:Time_ns.Span.to_min ~construct:Time_ns.Span.of_min]
  ;;

  let hr =
    [%accessor Accessor.isomorphism ~get:Time_ns.Span.to_hr ~construct:Time_ns.Span.of_hr]
  ;;

  let day =
    [%accessor
      Accessor.isomorphism ~get:Time_ns.Span.to_day ~construct:Time_ns.Span.of_day]
  ;;
end
