;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                   arrogant-theme.el: UI configuration                      ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(require 'color-theme)

;;(color-theme-initialize)

(load-file "~/.emacs.d/arrogant/theme.el")
(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:foreground "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0c0c0c"))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "#3b5998"))))
 '(company-tooltip-selection
   ((t (:background "#3b5998" :foreground "white"))))
 '(company-tooltip-common
   ((t (:background "lightgray" :foreground "#3b5998" :weight bold))))
 '(company-tooltip-common-selection
   ((t (:background "#3b5998" :foreground "white" :weight bold))))
 '(company-tooltip-annotation
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-annotation-selection
      ((t (:background "#3b5998" :foreground "#f5f5f5")))))

(provide 'arrogant-theme)
