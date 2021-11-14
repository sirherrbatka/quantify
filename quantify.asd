;;;; metering.asd

(asdf:defsystem #:quantify
  :name "Quantify"
  :version "1.0"
  :description "Portable Code Profiling Tool"
  :author "Mark Kantrowitz <mkant@cs.cmu.edu>"
  :maintainer "Marek Kochanowicz"
  :license "Public Domain"
  :serial t
  :depends-on (#:alexandria)
  :components ((:cl-source-file.cl "metering"))
  :in-order-to ((asdf:test-op
                 (asdf:test-op #:metering/test))))

(asdf:defsystem #:metering/test
  :depends-on (#:metering #:fiveam)
  :components ((:file "metering-test"))
  :perform (asdf:test-op (o s)
             (funcall (intern (string '#:run!) :metering/test)
                      :metering-suite)))
