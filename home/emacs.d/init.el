;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq is-mac (equal system-type 'darwin))

(if is-mac
    (cond (
          (defvar path-to-cmake-app "/Applications/CMake.App/Contents/share/")
          (if (file-directory-p path-to-cmake-app) (cond (
                (defvar cmake-dir (directory-files path-to-cmake-app nil "cmake-*"))
                (setq load-path (cons (expand-file-name (concat path-to-cmake-app (car cmake-dir) "/editors/emacs/")) load-path))
                (require 'cmake-mode)
          ))
         ))
    )
  )

(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))

(define-coding-system-alias 'UTF-8 'utf-8)
(setq user-emacs-directory (file-truename "~/.emacs.d/"))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(load (concat user-emacs-directory "whitespace_config.el"))

;; Showing line numbers
(when (version<= "26.0.50" emacs-version )
    (global-display-line-numbers-mode))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
    (setq default-buffer-file-coding-system 'utf-8)
  )

;(defun configure-python-mode
;    (setq python-indent-offset 2)
;  )

;(add-hook 'python-mode-hook 'configure-python-mode)

(setq ns-pop-up-frames nil)

(defvar aspell-binary "/usr/local/bin/aspell")
(if (file-exists-p aspell-binary) (setq ispell-program-name aspell-binary))

(setq-default tab-always-indent 'complete)
