;; VARIOUS CHANGES AND ADDITIONS IN HERE


;;================================================================================ 
;; VISUAL
(setq inhibit-startup-message t)        ;; skip welcome screen
(load-theme 'ample t)                 ;; load theme to use
(global-linum-mode t)                   ;; activate line numbers
(tool-bar-mode -1)                      ;; hide toolbar
(setq-default truncate-lines t)         ;; turn off line wrapping
(set-frame-font "Inconsolata-12")
(scroll-bar-mode -1)                    ;; remove scroll bar

;;================================================================================ 
;; KEYMAPS
;; change window with <Shift+arrow>
(windmove-default-keybindings)

;;================================================================================ 
;; ENABLE FLYCHECK
(add-hook 'after-init-hook #'global-flycheck-mode)

;;================================================================================ 
;; ENABLE AUTOCOMPLETE
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

;;================================================================================ 
;; EMACS SAVEFILES (*.~)
(setq backup-directory-alist `(("." . "~/.saves")))
