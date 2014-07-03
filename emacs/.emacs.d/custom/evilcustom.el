;; changes and modifications of the evil mode

;; map jj to exit insert mode 
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

;;Not sure why this isn’t the default – it is in vim – but this makes C-u to go up half a page
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; make evil work with screen lines instead of logical lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
