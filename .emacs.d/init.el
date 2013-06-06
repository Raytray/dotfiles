(setq-default linum-format "%d ")
(global-linum-mode t)
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/deft")
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist)
      )
(load "jinja")
(load "markdown-mode")
(load "git-commit")

;;deft
(load "deft")
(setq deft-extension "md")
(setq deft-use-filename-as-title t)
(setq deft-auto-save-interval 0)
(define-minor-mode deft-note-mode "Deft notes" nil " Deft-Notes" nil)
(setq deft-text-mode 'markdown-mode)
(defun kill-all-deft-notes ()
  (interactive)
  (save-excursion
    (let((count 0))
      (dolist(buffer (buffer-list))
        (set-buffer buffer)
        (when (not (eq nil deft-note-mode))
          (setq count (1+ count))
          (kill-buffer buffer)))
      )))
(defun deft-or-close () (interactive) (if (or (eq major-mode 'deft-mode) (not (eq nil deft-note-mode)))
                                          (progn (kill-all-deft-notes) (kill-buffer "*Deft*"))
                                        (deft)
                                        ))
;;Keybindings
(global-set-key [f6] 'deft-or-close)
(global-set-key (kbd "C-c v") 'compile)
(global-set-key (kbd "C-c C-v") 'recompile)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-c t") 'untabify)

;; 4 spaces to a tab.
(setq-default c-basic-offset 4)
(setq-default python-indent 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))
(add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, changing to 4.
          (set (make-local-variable 'sgml-basic-offset) 4)))

;; Show whitespace
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'change-major-mode-hook
          (lambda ()
            (add-hook 'font-lock-mode-hook
                      'hc-highlight-trailing-whitespace)))

(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(put 'upcase-region 'disabled nil)
