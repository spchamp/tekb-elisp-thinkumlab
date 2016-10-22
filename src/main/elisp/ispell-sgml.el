;; ispell-sgml.el

;; Note: see also "CONFIGURATION" section in aspell(1)

(defcustom ispell-program-sgml-options '("-H")
  "Additional command-line options for `ispell-region-sgml`"
  :type '(list)
  :group 'ispell)

(require 'ispell)

(defun ispell-region-sgml (start end)
  (let ((ispell-extra-args
         (append ispell-program-sgml-options
                 ispell-extra-args)))
    (ispell-region start end)))

(defun ispell-buffer-sgml ()
  (interactive)
  (ispell-region-sgml (point-min) (point-max)))

(defun ispell-sgml ()
  (interactive)
  (cond
   ((and (if (boundp 'transient-mark-mode)
             transient-mark-mode t)
         (and (boundp 'mark-active) mark-active))
    (ispell-region-sgml (region-beginning) (region-end)))
   (t (ispell-buffer-sgml))))
