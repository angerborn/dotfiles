;; VARIOUS CHANGES AND ADDITIONS IN HERE



;;================================================================================ 
;; VISUAL

(setq inhibit-startup-message t)        ;; skip welcome screen
(load-theme 'purple-haze t)                 ;; load theme to use
(global-linum-mode t)                   ;; activate line numbers
(tool-bar-mode -1)                      ;; hide toolbar
(setq-default truncate-lines t)         ;; turn off line wrapping
(set-default-font "Inconsolata-12")
(scroll-bar-mode -1)                    ;; remove scroll bar
;;================================================================================ 
;; KEYMAPS

;; change window with <Shift+arrow>
(windmove-default-keybindings)

;;================================================================================ 
;; EMACS SAVEFILES (*.~)

(setq backup-directory-alist `(("." . "~/.saves")))
