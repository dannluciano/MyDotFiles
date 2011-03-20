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
(textmate-mode)
(require 'peepopen)

;; Mac-friendley keys map

;; (global-set-key (kbd "M-s") 'save-buffer)
;;(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; (set-frame-font "Monaco-13")

(defun recompile-init ()
  "Byte-compile .emacs.d"
  (interactive)
  (byte-recompile-directory dotfiles-dir))

;; C Mode

(add-hook 'c-mode-hook 'flymake-mode)

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