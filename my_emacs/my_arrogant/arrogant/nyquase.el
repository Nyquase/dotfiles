;;
;; nyquase.el for my_bindings in /home/nykku/.emacs.d/arrogant
;; 
;; Made by Nyq
;; Login   <nykku@epitech.eu>
;; 
;; Started on  Thu May 11 00:53:01 2017 Nyq
;; Last update Tue May 30 18:30:57 2017 Nyq
;;


;;Pour changer facilement de buffer
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;surbrillance de la region
(setq transient-mark-mode t)

;; Disable blinking cursor
(blink-cursor-mode 0)

;; Clear whitespaces
;(define-key text-mode-map (kbd "<f8>") 'delete-trailing-whitespace)
(global-set-key (kbd "<f8>") 'delete-trailing-whitespace)

;; Replace
(global-set-key (kbd "<f7>") 'query-replace-regexp)

;; Linum-mode
(global-set-key (kbd "<f6>") 'linum-mode)

;;Key Binding
(define-key global-map "\C-p" 'split-window-right)
(define-key global-map "\C-o" 'split-window-below)
(define-key global-map "\C-f" 'find-file-other-window)
(define-key global-map "\C-a" 'delete-window)
(global-set-key (kbd "<f2>") 'tab-to-tab-stop)
