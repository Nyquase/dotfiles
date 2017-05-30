;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;            arrogant-yasnippets.el: configuration for yasnippets            ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet)

(defun arrogant-setup-yasnippet()
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/arrogant/yasnippets")
  (yas-global-mode)
  )

(provide 'arrogant-yasnippet)
