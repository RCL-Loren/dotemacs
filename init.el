(require 'package)
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(add-to-list 'custom-theme-load-path "~/.emacs.d/color-themes")
;;(load-theme 'wombat t)

(load-file "~/.emacs.d/color-themes/modified-tty-dark.el")
(color-theme-tty-dark-modified)

(require 'ido)
(ido-mode t)

(require 'git)

(tool-bar-mode -1)

(setq column-number-mode t)

(delete-selection-mode 1)

(defun c-code-setup-hook() 
  "Hook function to setup c style files"
  ;; Available C style:
  ;; “gnu”: The default style for GNU projects
  ;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
  ;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
  ;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
  ;; “stroustrup”: What Stroustrup, the author of C++ used in his book
  ;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
  ;; “linux”: What the Linux developers use for kernel development
  ;; “python”: What Python developers use for extension modules
  ;; “java”: The default style for java-mode (see below)
  ;; “user”: When you want to define your own style
  (setq c-default-style "k&r")
  
  (setq c-basic-offset 2)
  
  ; Setup  code folding
  (local-set-key (kbd "C-c <right>") 'hs-show-block)
  (local-set-key (kbd "C-c <left>") 'hs-hide-block) 
  (local-set-key (kbd "C-c <up>") 'hs-hide-all)
  (local-set-key (kbd "C-c <down>") 'hs-show-all)
  (hs-minor-mode t)
  
)

; Callback function that gets invoked on 
; all C files. 
(add-hook 'c-mode-common-hook 'c-code-setup-hook)

(global-set-key (kbd "M-<left>") 'beginning-of-line) 
(global-set-key (kbd "M-<right>") 'end-of-line)
