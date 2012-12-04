(setq inhibit-startup-screen t)
; set font family and size
(set-face-attribute 'default nil :font "Consolas" :height 200)
;(set-default-font "-apple-Consolas-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
;(modify-frame-parameters nil '((wait-for-wm . nil)))
; set default window size to full screen
; (require 'maxframe)
;  (add-hook 'window-setup-hook 'maximize-frame t)

; set default theme
(load-theme 'solarized-dark t)

; set default line spacing
(setq-default line-spacing 5)

; enable arrow keys
(guru-mode -1)

; hide toolbar
(tool-bar-mode -1)

;org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-skip-scheduled-if-done t)
;; mobile org
;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/todo")
;; tag position
(setq org-tags-column 120)

;;default folder
(cd "~/Dropbox/todo")

(setq split-height-threshold 40) ; nil
(setq split-width-threshold 120) ; 100

(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
