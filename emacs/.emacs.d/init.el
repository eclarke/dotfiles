;;-----------------------------------------------------------------------;;
;;  ecl general config file for emacs >=24
;;-----------------------------------------------------------------------;;

;;-----------------------------------------------------------------------;;
;;  General options
;;-----------------------------------------------------------------------;;
(setq-default fill-column 80)
(column-number-mode 1)
(setq make-backup-files t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq inhibit-startup-message t)

;; Unnecessary UI --> gone
(when (display-graphic-p)
    (scroll-bar-mode -1)
    (tool-bar-mode -1)
    (menu-bar-mode -1))

;; No tabs
(setq tab-width 2
      indent-tabs-mode nil)
;; Key bindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; Ido stuff
;; (ido-mode t)
;; (setq ido-enable-flex-matching t
;;       ido-use-virtual-buffers)

;; Temp files --> gone
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;-----------------------------------------------------------------------;;
;;  TRAMP mode stuff
;;-----------------------------------------------------------------------;;
(setq tramp-default-method "ssh"
      tramp-default-host "microb120.med.upenn.edu"
      tramp-default-user "ecl")

;;-----------------------------------------------------------------------;;
;;  package repos
;;-----------------------------------------------------------------------;;
(require 'package)
;; Add melpa repository to archives
;; (add-to-list 'package-archives
;;   	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; Initialize packages
(package-initialize)
;; Common packages
(defvar my/packages
  '(company snakemake-mode flycheck elpy))

;; ----- Install packages from my/packages -----
(require 'cl-lib)

(defun my/install-packages ()
  "Ensure the packages I use are installed. See `my/packages'."
  (interactive)
  (let ((missing-packages (cl-remove-if #'package-installed-p my/packages)))
    (when missing-packages
      (message "Installing %d missing package(s)" (length missing-packages))
      (package-refresh-contents)
      (mapc #'package-install missing-packages))))

(my/install-packages)

;;-----------------------------------------------------------------------;;
;;  Python development
;;-----------------------------------------------------------------------;;
(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; (elpy-use-ipython)


;;-----------------------------------------------------------------------;;
;;  Rust development
;;-----------------------------------------------------------------------;;
(setq racer-cmd "/Users/ecl/.cargo/bin/racer")
(setq racer-rust-src-path "/Users/ecl/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src")

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook
	  '(lambda ()
	     (racer-mode)
	     (racer-turn-on-eldoc)
	     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	     (set (make-local-variable 'company-backends) '(company-racer))))

;;-----------------------------------------------------------------------;;
;;  External dependencies
;;-----------------------------------------------------------------------;;
(ignore-errors
  (load "~/.config/emacs.d/howdoi")
  (load "~/.config/emacs.d/lab-notebook"))

;;-----------------------------------------------------------------------;;
;;  Company mode
;;-----------------------------------------------------------------------;;
;; Enable company globally for all mode
(global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

;;-----------------------------------------------------------------------;;
;;  Emacs-provided stuff
;;-----------------------------------------------------------------------;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (material-light)))
 '(custom-safe-themes
   (quote
    ("e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "afbb40954f67924d3153f27b6d3399df221b2050f2a72eb2cfa8d29ca783c5a8" "05411251e1232959144334e4359f8af0931c6c1a2f3a109d0d9e6753b6dfecfe" "590759adc4a5bf7a183df81654cce13b96089e026af67d92b5eec658fb3fe22f" "21fb497b14820147b2b214e640b3c5ee19fcadc15bc288e3c16c9c9575d95d66" "dcbe22bc74153257f412183dd14ab9652197f59adf65646e618c2577e7cca34d" default)))
 '(fci-rule-color "#383838")
 '(hl-sexp-background-color "#efebe9")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (markdown-mode+ cargo flycheck flycheck-mypy flycheck-rust racer rust-mode rustfmt gotham-theme leuven-theme zenburn-theme snakemake-mode material-theme markdown-mode eink-theme cyberpunk-theme yaml-mode magit company)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "gray60" :slant oblique :weight normal)))))
