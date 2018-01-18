;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;          arrogant-python-mode.el: configuration for python-mode            ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'arrogant-settings)

(defun arrogant-python-mode-hook()
  (setq python-indent-offset 4)
  (when arrogant-use-jedi
    (jedi:setup)
    (setq jedi:complete-on-dot t)
    )
  )

(add-hook 'python-mode-hook 'arrogant-python-mode-hook)

(provide 'arrogant-python-mode)
