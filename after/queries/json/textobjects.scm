;; extends

;; JSON object entries:
;;
;; {
;;   "foo": "bar"
;; }
;;
;; ae -> "foo": "bar"
;; ie -> "bar"
(pair) @entry.outer

(pair
  value: (_) @entry.inner)
