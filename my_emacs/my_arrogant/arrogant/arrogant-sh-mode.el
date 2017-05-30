;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;              arrogant-sh-mode.el: configuration for sh-mode                ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'arrogant-settings)

(when arrogant-use-sh-complete
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-shell))
  (defun arrogant-sh-mode-hook()
    (company-mode)
    )
  (add-hook 'sh-mode-hook 'arrogant-sh-mode-hook)
  )


(provide 'arrogant-sh-mode)
