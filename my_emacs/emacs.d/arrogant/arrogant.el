;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                  arrogant.el: arrogant-emacs main file                     ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(setq package-list '(irony
		     irony-eldoc
		     flycheck-irony
		     company-irony
		     company-irony-c-headers
		     company-shell
		     yasnippet
		     jedi))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("elpa" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'arrogant-settings)
(require 'arrogant-c-mode)
(require 'arrogant-c++-mode)
(require 'arrogant-python-mode)
(require 'arrogant-sh-mode)
(require 'arrogant-commit-mode)
(require 'arrogant-keys)
(require 'arrogant-theme)
(require 'arrogant-yasnippet)
(require 'arrogant-utils)



(when (file-exists-p arrogant-std-el)
  (load arrogant-std-el))
(when (file-exists-p arrogant-std-comment-el)
  (load arrogant-std-comment-el))

(when arrogant-use-commit-mode
  (add-to-list 'auto-mode-alist '("^COMMIT_EDITMSG$" . arrogant-commit-mode)))

(setq arrogant-use-jedi nil)
(when arrogant-use-yasnippet
  (arrogant-setup-yasnippet))

;;(add-to-list 'auto-mode-alist '("\.h$" . c++-mode))

;;(global-set-key "\t" 'company-complete-common)

(provide 'arrogant)
