(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-blackboard)))

(setq inhibit-startup-screen t)
; set font family and size
(set-face-attribute 'default nil :font "Consolas" :height 160)
;(set-default-font "-apple-Consolas-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
;(modify-frame-parameters nil '((wait-for-wm . nil)))
; set window size
(setq default-frame-alist (add-to-list 'default-frame-alist '(width . 1024)))
(setq default-frame-alist (add-to-list 'default-frame-alist '(height  . 768)))

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
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/todo/todo.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files (quote ("~/Dropbox/todo/")))
;; tag position
(setq org-tags-column 120)

;cedet - project management
;(load-file "~/.emacs.d/cedet-1.0pre7/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;ecb
;(add-to-list 'load-path 
;             "~/.emacs.d/ecb-2.40")
;(require 'ecb)

;;default folder
(cd "~/Dropbox/todo")

(setq split-height-threshold 40) ; nil
(setq split-width-threshold nil) ; 100

;; See http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_620.html
;; and http://www.gnu.org/software/emacs/manual/elisp.pdf

;; disable line wrap
(setq default-truncate-lines t)

;; make side by side buffers function the same as the main window
(setq truncate-partial-width-windows nil)

;; Add F12 to toggle line wrap
(global-set-key [f6] 'toggle-truncate-lines)

