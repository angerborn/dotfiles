;; initialize package handlers
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; initialize packages
(package-initialize)
;; check if the packages are installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(
   ag
   evil
   key-chord
   ;; color themes
   obsidian-theme
   solarized-theme
   purple-haze-theme
   )
 )


;; needed by some other package
(require 'cl)

;; add special directories to load path
(add-to-list 'load-path "~/.emacs.d/custom/")


;; activate modes
(evil-mode t)             ;; evil
(key-chord-mode t)        ;; key-chord
;;(global-hl-line-mode)     ;; highlight current line
(winner-mode 1)

;; Load my own customizations for everything
(load "evilcustom") ;; customizations for evil
(load "various")    ;; various settings
(load "cursorcolor.el") ;; custom color for cursor

;; Put emacs in front
(x-focus-frame nil)

;;================================================================================
;; GENERATED BY EMACS ...

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(cursor-color "#657b83")
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "936e5cac238333f251a8d76a2ed96c8191b1e755782c99ea1d7b8c215e66d11e" default)))
 '(foreground-color "#657b83"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


