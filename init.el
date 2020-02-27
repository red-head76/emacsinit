;; init.el --- Emacs configuration

;; Add and enable MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; add your modules path
(mapc 'load (directory-files "~/.emacs.d/custom" t ".*\.el"))

;; load your modules
(require 'setup-applications)
;; (require 'setup-communication)
(require 'setup-convenience)
;; (require 'setup-helm)
;; (require 'setup-data)
;; (require 'setup-development)
(require 'setup-editing)
;; (require 'setup-environment)
;; (require 'setup-external)
;; (require 'setup-faces)
;; (require 'setup-files)
;; (require 'setup-help)
;; (require 'setup-programming)
(require 'setup-text)
;; (require 'setup-local)

;; INSTALL PACKAGES
;; --------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp")

(when (not package-archive-contents)
  (package-refresh-contents))

;; (defvar myPackages
;;   '())

;; (mapc #'(lambda (package)
;; 	  (unless (package-installed-p package)
;; 	    (package-install package)))
;;       myPackages)


;; GENERAL BASIC CUSTOMIZATION
;; --------------------------------------
;; disable loading the default library (.emacs), if there is any
(setq inhibit-default-init t)
;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; Theme
(load-theme 'material t) ;; load material theme

(defalias 'yes-or-no-p 'y-or-n-p)       ;; y or n is enough
(setq inhibit-startup-message t) ;; hide the startup message

(global-linum-mode t) ;; enable line numbers globally
(setq column-number-mode t);; enable column numbers
(tool-bar-mode -1) ;; disable toolbar


;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; Do this at the very end, when you have set all your backends
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (yasnippet-snippets company py-autopep8 undo-tree yasnippet elpy magit org ivy workgroups2 volatile-highlights material-theme ibuffer-vc gnu-elpa-keyring-update expand-region ergoemacs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
