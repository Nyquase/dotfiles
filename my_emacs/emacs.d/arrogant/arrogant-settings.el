;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;              arrogant-settings.el: arrogant-emacs settings                 ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Disable the GNU startup message
(setq inhibit-startup-message t)

;;Set the scratch buffer content to whatever you want
(setq initial-scratch-message ";;Salut salut salut salut salut")

;;Hide mode names
(setq mode-line-modes "")

;;Highlight the parenthesis matching the one under the cursor
(show-paren-mode)

;;Display line and column number at bottom
(line-number-mode t)
(column-number-mode t)

;;Show line numbers on the left
(global-linum-mode t)
(setq linum-format "%3d \u2502")

;;Auto-refresh buffer contents when the associated file changes
(global-auto-revert-mode)

;;Display the current function name
(which-function-mode t)

;;Allows Ctrl-Space for multiline selection (usually on by default)
(setq transient-mark-mode t)

;;Automatically insert the matching symbol for "'({[
(electric-pair-mode)
(setq electric-pair-pairs '(
			    (?\" . ?\")
			    (?\{ . ?\})
			    (?\[ . ?\])
			    (?\' . ?\')
			    ))

;;Replace 'yes/no' prompts with 'y/n'
(fset 'yes-or-no-p 'y-or-n-p)

;;Backslash at 78th column for multiline macros
(setq c-backslash-column 77)
(setq c-backslash-max-column 77)

;;Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;;Automatically remove trailing blanks when writing to a file
;;(add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)

;;Kill current buffer when exiting emacsclient (for server mode only)
(add-hook 'server-done-hook (lambda nil (kill-buffer nil)))

(defgroup arrogant-settings nil
  "Customizable stuff"
  :group 'local
  )

(defcustom arrogant-use-yasnippet 't
  "Set to true to use yasnippet"
  :group 'arrogant-settings
  :type 'boolean
  )

(defcustom arrogant-use-jedi 't
  "Set to true to use jedi when editing Python code"
  :group 'arrogant-settings
  :type 'boolean
  )

(defcustom arrogant-use-sh-complete 't
  "Set to true to use company-shell for sh-mode"
  :group 'arrogant-settings
  :type 'boolean
  )

(defcustom arrogant-use-intellisense 't
  "Set to true to use Arrogant's intellisense configuration for C/C++"
  :group 'arrogant-settings
  :type 'boolean
  )

(defcustom arrogant-std-el "~/.emacs.d/arrogant/std.el"
  "Path to the std.el file"
  :group 'arrogant-settings
  :type '(string)
  )

(defcustom arrogant-std-comment-el "~/.emacs.d/arrogant/std_comment.el"
  "Path to the std_comment.el file"
  :group 'arrogant-settings
  :type '(string)
  )

(defcustom arrogant-use-commit-mode 't
  "Set to true to use arrogant-commit-mode for commit messages"
  :group 'arrogant-settings
  :type 'boolean
  )

(provide 'arrogant-settings)
