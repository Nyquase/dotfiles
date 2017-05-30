;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;        arrogant-commit-mode.el: Major mode to edit commit messages         ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'whitespace)

(defvar arrogant-commit-mode-st
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?# "<" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for arrogant-commit-mode")

(setq arrogant-commit-mode-hl
      '(("^[a-zA-Z/_\-]+:" . font-lock-constant-face)
	("#" . font-lock-comment-face))
      )

(define-derived-mode arrogant-commit-mode fundamental-mode "Arrogant commit mode"
  "A major mode for editing Git's commit messages"
  :syntax-table arrogant-commit-mode-st
  (setq-local comment-start "# ")
  (setq-local comment-start-skip "#+\\s-*")
  (setq-local font-lock-defaults '(arrogant-commit-mode-hl))
  (setq whitespace-style '(face lines-tail trailing))
  (setq whitespace-line-column 72)
  (whitespace-mode t)
  )

(provide 'arrogant-commit-mode)
