;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                 arrogant-cc.el: configuration for c-mode                   ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'arrogant-cc)

(defun arrogant-c-mode-hook()
  (arrogant-cc-setup)
  ;;BLABLA
  )

(add-hook 'c-mode-hook 'arrogant-c-mode-hook)

(provide 'arrogant-c-mode)
