;;--------------------------------------------------------------------------------
;; VISUAL
;;--------------------------------------------------------------------------------
(setq inhibit-startup-message t)
(load-theme 'wombat t)
(global-linum-mode t)
(tool-bar-mode -1)
(setq-default truncate-lines t)
(scroll-bar-mode -1)

;;--------------------------------------------------------------------------------
;; ENABLE FLYCHECK
;;--------------------------------------------------------------------------------
(add-hook 'after-init-hook #'global-flycheck-mode)

;;--------------------------------------------------------------------------------
;; ENABLE AUTOCOMPLETE
;;--------------------------------------------------------------------------------
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

;;--------------------------------------------------------------------------------
;; EMACS SAVEFILES (*.~)
;;--------------------------------------------------------------------------------
(setq make-backup-files nil)

(provide 'init-various)
