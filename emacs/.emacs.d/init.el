;;; init.el --- Summary
;;; Commentary:
;;; Main file of angerborns Emacs config, loads all other files and package manager

;;; Code:

(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Check if the packages are installed; if not, install them.
(mapc
 (lambda (package)
   (or (package-installed-p package)
           (package-install package)))
 '(
   ag
   auto-complete
   evil
   flycheck
   key-chord

   ;; Themes
   ample-theme
   solarized-theme
   )
 )

(require 'init-evil)
(require 'init-various)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
