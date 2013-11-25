(setq-default linum-format "%d ")
(setq column-number-mode t)
(global-linum-mode t)
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/deft")
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(add-to-list 'load-path "~/.emacs.d/plugins//hideshow-org")
(require 'hideshow-org)

(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist)
      )
(load "jinja")
(load "markdown-mode")
(load "git-commit")
(load "scss-mode")
(load "less-css-mode")
(load "rainbow-delimiters")
(require 'rainbow-delimiters)

(menu-bar-mode -1)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;multi-web-mode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "j2"))
(multi-web-global-mode 0)

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
(global-set-key (kbd "C-c t") 'untabify)
(global-set-key "\C-ch" 'hs-org/minor-mode)

;;Default modes
(setq auto-mode-alist
      (cons '("\\.zsh" . shell-script-mode) auto-mode-alist)
      )

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
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#0000ee"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#00cdcd"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#cd00cd"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#cdcd00"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#e5e5e5"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#00cdcd"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#cd00cd"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#cdcd00"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#e5e5e5")))))
