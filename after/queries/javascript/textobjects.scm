;; extends

;; Object literal entries:
;;
;; const obj = {
;;   foo: bar,
;; }
;;
;; ae -> foo: bar
;; ie -> bar
(pair) @entry.outer

(pair
  value: (_) @entry.inner)

;; Shorthand object properties:
;;
;; const obj = { foo }
;;
;; ae -> foo
;; ie -> foo
(shorthand_property_identifier) @entry.outer
(shorthand_property_identifier) @entry.inner
