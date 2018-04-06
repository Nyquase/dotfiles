;; ----------------------------------
;;           EPITECH CONFIG
;; ----------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "std.el")
(load "std_comment.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/arrogant")

(load "arrogant.el")

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("elpa" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(add-to-list 'custom-theme-load-path
	     "~/.emacs.d/themes/")

(add-to-list 'auto-mode-alist '("\\emacs\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\config\\'" . conf-mode))

(setq irony-additional-clang-options '("-std=c++14"))

(require 'yasnippet)
(yas-global-mode 1)

(require 'multiple-cursors)
(global-set-key "\C-g" 'mc/mark-all-like-this)
(global-set-key "\C-xg" 'mc/keyboard-quit)

;; Yanking
(define-key global-map "\C-v" 'yank)

;; Open top menu
(global-set-key "\C-xm" 'menu-bar-open)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("3f1dcd824a683e0ab194b3a1daac18a923eed4dba5269eecb050c718ab4d5a26" "05eeb814f74b2fd4f2e6e37b4d604eb9b1daaaedfa5e692f1d485250c6b553eb" "ad109c1ad8115573f40e22ac2b996693b5d48052fa37b5919f70ea37c62a965e" "75c5c39809c52d48cb9dcbf1694bf2d27d5f6fd053777c194e0b69d8e49031c0" "0055e55e6a357a941027139152a67f93376616d3501055d06852f10fdc16bac0" "54e08527b4f4b127ebf7359acbbbecfab55152da01716c4809682eb71937fd33" "81db42d019a738d388596533bd1b5d66aef3663842172f3696733c0aab05a150" "065da018725a9c72ee0358cb8e52bedfd402b222b971ba39b21a17bba84b0626" "0f90f1a9b666877d24d93d8c6330a5b68becdebe1cc55ef859799e84c6c4c08e" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (irony yasnippet multiple-cursors jedi irony-eldoc gruvbox-theme flycheck-irony company-shell company-irony-c-headers company-irony)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "color-16" :foreground "#F5F5F5" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:foreground "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0c0c0c"))))
 '(company-tooltip ((t (:background "lightgray" :foreground "#3b5998"))))
 '(company-tooltip-annotation ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-annotation-selection ((t (:background "#3b5998" :foreground "#f5f5f5"))))
 '(company-tooltip-common ((t (:background "lightgray" :foreground "#3b5998" :weight bold))))
 '(company-tooltip-common-selection ((t (:background "#3b5998" :foreground "white" :weight bold))))
 '(company-tooltip-selection ((t (:background "#3b5998" :foreground "white"))))
 '(linum ((t (:inherit default)))))
