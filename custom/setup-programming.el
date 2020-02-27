(provide 'setup-programming)


;; Package: PYTHON-ELPY
;; ---------------------------------------
(add-hook 'python-mode-hook (lambda() (flyspell-prog-mode))) ;; flyspell for mi baad inglisch
(require 'elpy)
(elpy-enable)
(setq elpy-rpc-python-command "python3") ;;use python3
(setq python-shell-interpreter "python3");;use python3
(setq elpy-shell-echo-input nil)
(setq python-shell-completion-native-enable nil)
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Python-Elpy keys, disabled because of ergoemacs
;; (global-set-key (kbd "M-n") 'elpy-nav-forward-block)   ;;move block down
;; (global-set-key (kbd "M-p") 'elpy-nav-backward-block)  ;;move block up
;; (global-set-key (kbd "<M-up>") 'elpy-nav-move-line-or-region-up) ;;move line or region up
;; (global-set-key (kbd "<M-down>") 'elpy-nav-move-line-or-region-down) ;;move line or region down
;; (global-set-key (kbd "M-,") 'pop-tag-mark) ;; go to last place where M-. was used (go-to-definition)

;; Python ROOT
(setenv "ROOTSYS" "/usr/local/root")
(setenv "PYTHONDIR" "/usr/local/root:$PYTONDIR")
(setenv "PYTHONPATH" "/usr/local/root/lib::/usr/local/root/bindings/pyroot:$PYTHONPATH")
;; (setenv "PATH" "/usr/local/root/bin")
(setenv "LD_LIBRARY_PATH"
    "/usr/local/root/lib:/usr/local/root/lib:/usr/local/root/bindings/pyroot:$LD_LIBRARY_PATH")

;; Latex
;; ---------------------------
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTex-mode))
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
;; (add-hook 'LateX-mode-hook 'reftex-mode)
;; (load "auctex.el" nil t t)
;; (company-auctex-init)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq-default TeX-master "main")
(setq TeX-PDF-mode t)

;; Make okular work
(setq TeX-source-correlate-mode t
      TeX-source-correlate-start-server t)
(eval-after-load "tex"
  '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))


;; (setq company-math-disallow-unicode-symbols-in-face nil)
;; (append '((company-math-symbols-latex company-math-symbols-unicode
;;                                       company-auctex-macros company-auctex-environments))
;;         company-backends)

;; Java
;;----------------------------------------
(add-hook 'java-mode-hook
          (lambda ()
            "Treat Java 1.5 @-style annotations as comments."
            (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
            (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode t)))


;; C++
;; --------------------------
(add-hook 'c-mode-common-hook (lambda() (flyspell-prog-mode))) ;; flyspell for mi baad inglisch
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))         ;; open *.h data files with c++-mode
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook (lambda() (setq c-default-style "linux"
                                     c-basic-offset 2
                                     tab-width 2
                                     indent-tabs-mode t))
)

;; flycheck and google's cpplint checkstyle
(require 'flycheck)
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; if this isnt available, download it with the terminal command and place it in the elpa/flycheck folder
     ;; wget https://raw.githubusercontent.com/flycheck/flycheck-google-cpplint/master/flycheck-google-cpplint.el
     (flycheck-add-next-checker 'c/c++-clang
				'(warning . c/c++-googlelint))))

(add-hook 'c++-mode-hook
	  (lambda () (setq flycheck-clang-language-standard "c++11")))
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;; ;; cmake-ide
;; (require 'cmake-ide)
;; (cmake-ide-setup)
;; (setq cmake-ide-flags-c++ (append '("std=c++11")))


;; ;; irony for completion
;; (require 'irony)
;; (require 'company-irony-c-headers)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'c++-mode-hook 'irony-mode)

;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map
;;     [remap completion-at-point] 'irony-completion-at-point)
;;   (define-key irony-mode-map
;;     [remap complete-symbol] 'irony-completion-at-point))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; ;;(eval-after-load 'company '(add-to-list 'company-backends '(company-clang company-irony-c-headers
;; ;; company-irony)))
;; 'company (add-to-list 'company-backends '(company-irony company-irony-c-headers))
