;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

(add-to-list 'load-path "~/.emacs.d/epitech")

(load "std.el")
(load "std_comment.el")
(if (file-exists-p "~/.nyqemacs")
    (load-file "~/.nyqemacs"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (sokoban))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "brightcyan"))))
 '(font-lock-function-name-face ((t (:foreground "DodgerBlue"))))
 '(font-lock-string-face ((t (:foreground "blue"))))
 '(highlight ((t (:weight bold))))
 '(my-loong-line-face ((((class color)) (:background "yellow"))) t)
 '(my-tab-face ((((class color)) (:foreground "black" :weight bold :underline t))) t))
