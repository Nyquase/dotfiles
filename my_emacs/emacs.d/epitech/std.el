;;
;; div.el for emacs conf in site-local
;; 
;; Made by Nicolas Sadirac
;; Login   <rn@epita.fr>
;; 
;; Started on  Sun Oct 17 02:20:57 1993 Nicolas Sadirac
;; Last update Tue Sep 13 13:33:55 2016 clement doumergue
;;

(defun do_insert_time()
  (interactive)
  (insert-string (current-time-string)))
(set-variable 'c-argdecl-indent   0)

(normal-erase-is-backspace-mode 0)

(global-set-key "" 'backward-delete-char)
(global-set-key "" 'compile)
(global-set-key "" 'goto-line)
