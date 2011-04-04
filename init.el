;; Begin init.el
;; Author: Dann Luciano de Menezes <dannluciano@gmail.com>

;; Initial Options

(setq user-full-name "Dann Luciano de Menezes")
(setq user-mail-address "dannluciano@gmail.com")

(push "/usr/local/bin" exec-path)


;; (setq default-frame-plist '(width 180 height 50))

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; (setq ns-command-modifier 'meta) ;; Change Meta key for Command
(windmove-default-keybindings 'meta) ;;Change Keys for Switching Windows

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
;;(scroll-bar-mode -1)
;;(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
;;(set-fringe-style -1)
;;(tooltip-mode -1)

(set-frame-font "Menlo-14")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-frame-alist (quote ((vertical-scroll-bars . right) (tool-bar-lines . 0) (width . 158) (height . 46) (menu-bar-lines . 1) (background-color . "#000000") (background-mode . dark) (border-color . "#000000") (cursor-color . "#FFA560") (foreground-color . "#F6F3E8") (mouse-color . "sienna1"))))
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(ispell-local-dictionary "brasileiro")
 '(iswitchb-mode t nil (iswitchb))
 '(make-backup-files nil)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(mouse-wheel-mode t nil (mwheel))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-width-x 24)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(version-control t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(set-frame-position (selected-frame) 0 20);

;; LoadPath

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))

;; ELPA

(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path (concat dotfiles-dir "/elpa"))
(add-to-list 'load-path (concat dotfiles-dir "/elpa/textmate-1"))


;; SRSPEEDBAR

(require 'sr-speedbar)
;; Color-Theme

(require 'color-theme)
(color-theme-initialize)
;;(setq color-theme-is-global t)
(require 'color-theme-ir-black)
(color-theme-ir-black)

;; YASnippet

(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet/snippets"))

;; WhiteSpace

(require 'whitespace)

;; Eshell

(require 'ansi-color)
(require 'eshell)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
			      eshell-last-output-end))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)

;; Textmate

(require 'textmate)
(require 'peepopen)
(textmate-mode)
(setq ns-pop-up-frames nil)
(define-key *textmate-mode-map* [(super t)] 'peepopen-goto-file-gui)
;;(global-unset-key (kbd "s-t"))
;;(global-set-key (kbd "s-t") 'peepopen-goto-file-gui)
;;(define-key textmate-mode-map [(super t)] 'peepopen-goto-file-gui)

;; Mac-friendley keys map

;; (global-set-key (kbd "M-s") 'save-buffer)
;;(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
(global-set-key (kbd "s-b") 'list-buffers)
(global-set-key (kbd "s-3") 'split-window-horizontally)
(global-set-key (kbd "s-2") 'split-window-vertically)


;; (set-frame-font "Monaco-13")

(defun recompile-init ()
  "Byte-compile .emacs.d"
  (interactive)
  (byte-recompile-directory dotfiles-dir))

;; C Mode

(add-hook 'c-mode-hook 'flymake-mode)
(add-hook 'c-mode-hook 'sr-speedbar-open)

;; Ruby Mode
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

;; LaTeX

;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)

;; ESHELL

;;; starter-kit-eshell.el --- Making the defaults a bit saner
;;
;; Part of the Emacs Starter Kit

(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (require 'eshell-vc)
     (setenv "PAGER" "cat")
     (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
     (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
	       '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
     (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)))
(put 'downcase-region 'disabled nil)