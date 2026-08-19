;; extends

;; Object literal / JSON-like entries:
;;
;; const obj = {
;;   foo: bar,
;; }
(pair) @entry.outer

(pair
  value: (_) @entry.inner)

;; Shorthand object properties:
;;
;; const obj = { foo }
(shorthand_property_identifier) @entry.outer
(shorthand_property_identifier) @entry.inner

;; Type/interface entries:
;;
;; type User = {
;;   name: string
;;   age: number
;; }
;;
;; ae -> name: string
;; ie -> string
(property_signature) @entry.outer

(property_signature
  type: (_) @entry.inner)
