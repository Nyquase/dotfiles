;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                 arrogant-cc.el: configuration for cc-mode                  ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'arrogant-settings)

(eval-after-load 'company
  '(add-to-list 'company-backends '(company-irony-c-headers company-irony)))

(eval-after-load 'flycheck
'(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(defun arrogant-irony-mode-hook()
  (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
  (define-key irony-mode-map [remap completion-symbol] 'irony-completion-at-point-async)
  (irony-cdb-autosetup-compile-options)
  (company-irony-setup-begin-commands)
  (irony-eldoc)
  )

(defun arrogant-cc-setup()
  (when arrogant-use-intellisense
    (add-hook 'irony-mode-hook 'arrogant-irony-mode-hook)
    (company-mode)
    (setq company-idle-delay 0)
    (irony-mode)
    (flycheck-mode)
    )
  )

(provide 'arrogant-cc)
