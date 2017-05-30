;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                  arrogant-keys.el: keyboard shortcuts                      ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Enable C-x C-u to upcase a region and C-x C-l to downcase it
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;Assign F4 key to count-words
(global-set-key [f4] 'count-words-region)

;;Assign F5 to hexl-switch
(global-set-key [f5] 'arrogant-hexl-switch)

(global-set-key "\C-c\C-p\C-p" 'c++-mode)

;;Pour changer facilement de buffer
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;; Clear whitespaces
;(define-key text-mode-map (kbd "<f8>") 'delete-trailing-whitespace)
(global-set-key (kbd "<f8>") 'delete-trailing-whitespace)

;; Replace
(global-set-key (kbd "<f7>") 'query-replace-regexp)

;; Linum-mode
(global-set-key (kbd "<f6>") 'linum-mode)

;;Key Binding
(global-set-key "\C-p" 'split-window-right)
(global-set-key "\C-o" 'split-window-below)
(global-set-key "\C-f" 'find-file-other-window)
(global-set-key"\C-a" 'delete-window)
(global-set-key (kbd "<f2>") 'tab-to-tab-stop)

(provide 'arrogant-keys)
