;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;;                   arrogant-utils.el: various utilities                     ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun arrogant-hexl-switch()
  "Switch the current bufferfrom normal to hex orfrom hex to normal"
  (interactive)
  (if (equal major-mode 'hexl-mode)
      (hexl-mode-exit)
    (hexl-mode))
  )

(defun arrogant-google-it(word)
  "Search something on Google"
  (interactive "sKeyword: ")
  (browse-url (format "http://google.com/search?q=%s" word))
  )

(defun arrogant-indent-buffer()
  "Indent a whole buffer"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil))
  )

(defalias 'eob 'end-of-buffer
  "Go to the end of the current buffer"
  )
(defalias 'bob 'beginning-of-buffer
  "Go to the beginning of the current buffer"
  )

(defun arrogant-cc-disable-code()
  "Disable a region of code"
  (interactive)
  (setq start (min (region-end) (region-beginning)))
  (setq end (max (region-end) (region-beginning)))
  (goto-char end)
  (insert "\n#endif\n")
  (goto-char start)
  (insert "#if 0\n")
  )

(defun arrogant-spit-cpp()
  "Spit a .cpp file from a .hh file"
  (interactive)
  (when (string-match ".*\.hh$" (buffer-name))
    (setq spit-cpp-fname (replace-regexp-in-string (regexp-quote "\.hh") "\.cpp" (buffer-name) 'litteral))
    (save-current-buffer
      (set-buffer (get-buffer-create spit-cpp-fname)))
    )
  )


(provide 'arrogant-utils)
