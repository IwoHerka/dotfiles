;; Packages --------------------------------------------------------------------
;; Installed:
;; 1] neotree
;; 2] scss-mode
;; 3] typescript-mode
;; 4] column-fill-indicator

(require 'package)

;; Load packages.
(package-initialize)

;; Add MELPA to package repositories.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib.
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


;; UI --------------------------------------------------------------------------


;; Hide welcome screen.
(setq inhibit-startup-screen t)

;; Hide Scroll-bars.
(scroll-bar-mode -1)

;; Hide Tool-bar.
(tool-bar-mode -1)

;; Hide Menu-bar.
(menu-bar-mode -1)

;; Show line numbers.
(global-linum-mode 1)

;; Adjust scrolling.
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; 3 lines at a time.
(setq mouse-wheel-progressive-speed nil) ;; Don't accelerate scrolling.
(setq mouse-wheel-follow-mouse 't) ;; Scroll window under mouse.
(setq scroll-step 3) ;; Keyboard scroll 3 lines at a time.

;; Setup Neotree for tree view.
(require 'neotree)

;; Toggle Neotree with F8.
(global-set-key [f8] 'neotree-toggle)

;; Hide directory details in Dired mode.
(defun xah-dired-mode-setup ()
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'xah-dired-mode-setup)

;; Auto-reload buffer when file changes on disk.
(global-auto-revert-mode t)


;; Custom bindings -------------------------------------------------------------


;; Shift selection with Shift + Tab.
(global-set-key (kbd "<backtab>") 'indent-rigidly)

;; Setup standard Ctrl-C/V copy/paste.
(cua-mode 1)

;; Set C-] to kill buffer and window at once.
(global-set-key (kbd "C-0") 'kill-buffer-and-window)

;; Shortcut for killing buffer. Two clicks less!
(global-set-key (kbd "C-9") 'kill-this-buffer)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(global-set-key [f11] 'kill-other-buffers)

;; Editor ----------------------------------------------------------------------


;; Add automatic re-indentation.
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;; Bind it to F12.
(global-set-key [f12] 'indent-buffer)

;; Setup shortcut for this mode.
(global-set-key [f1] 'hs-minor-mode)

;; Setup folding shortcuts. Work in hs-minor-mode.
(global-set-key [f9] 'hs-hide-block)
(global-set-key [f10] 'hs-show-block)

;; Setup column indicator.
(require 'fill-column-indicator)
(fci-mode t)
(setq fci-rule-column 80)

;; Define global fci-mode and activate it.
(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)
(global-fci-mode 1)


;; Modes -----------------------------------------------------------------------


;; Sass.
(setq exec-path (cons (expand-file-name "/usr/bin/sass") exec-path))
(require 'scss-mode)


;; Start-up --------------------------------------------------------------------


;; Open this config.
(find-file "~/.emacs")


;; Theming ---------------------------------------------------------------------


;; Set custom font.
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 100 :width normal))))
  '(font-lock-comment-face ((t (:foreground "#648db4" :slant italic))))
  '(fringe ((t nil))))

;; Allo toggling transparency
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
        '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)
