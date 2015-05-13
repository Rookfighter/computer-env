;; install followig packages
;; package-install lua-mode
(setq inhibit-startup-message t)

(require 'package)
;; add MELPA
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; set mode for markdown files
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown$" . markdown-mode) auto-mode-alist))

(setq auto-save-default nil)
(setq backup-inhibited t)

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)

;; configure luamode
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'lua-mode))
(setq lua-indent-level 4)

;; configure ropemacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport 't)
