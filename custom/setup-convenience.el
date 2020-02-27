(provide 'setup-convenience)

;; Group: Convenience -> Revert

;; update any change made on file to the current buffer
(global-auto-revert-mode)

;; Group: Convenience -> Hippe Expand
;; hippie-expand is a better version of dabbrev-expand.
;; While dabbrev-expand searches for words you already typed, in current
;; buffers and other buffers, hippie-expand includes more sources,
;; such as filenames, kill ring.
(global-set-key (kbd "M-/" ) 'hippie-expand) ; replace dabbrev-expand
(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev ;; Try to expand word "dynamically", searching the current buffer.
   try-expand-dabbrev-all-buffers ;; Try to expand word "dynamically", searching all other buffers.
   try-expand-dabbrev-from-kill ;; Try to expand word "dynamically", searching the kill ring.
   try-complete-file-name-partially ;; Try to complete text as a file name, as many characters as unique.
   try-complete-file-name ;; Try to complete text as a file name.
   try-expand-all-abbrevs ;; Try to expand word before point according to all abbrev tables.
   try-expand-list ;; Try to complete the current line to an entire line in the buffer.
   try-expand-line ;; Try to complete the current line to an entire line in the buffer.
   try-complete-lisp-symbol-partially ;; Try to complete as an Emacs Lisp symbol, as many characters as unique.
   try-complete-lisp-symbol) ;; Try to complete word as an Emacs Lisp symbol.
 )

;; GROUP: Convenience -> Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-use-other-window t) ;; always display ibuffer in another window

;; whenever you create useless whitespace, the whitespace is highlighted
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w m") 'whitespace-mode)
(global-set-key (kbd "C-c w c") 'whitespace-cleanup)
(global-set-key (kbd "C-c c w") 'delete-trailing-whitespace) ; idk the difference yet

;; GROUP: Convenience -> Windmove
;; easier window navigation
(windmove-default-keybindings 'control)

;; Packages
;; ________________________________________________________________________________

;; Package: ergoemacs
;; ________________________________________
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "gb")
(ergoemacs-mode 1)
(global-set-key (kbd "C-SPC") 'set-mark-command) ;; since alt-spc and super-spc occupied in linux

;; Package: workgroups
;; ________________________________________
(require 'workgroups2)
(workgroups-mode 1)
(setq wg-session-load-on-start 0)

;; Package: expand-region
;; ________________________________________
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

;; Package: ivy mode (enhanced minibuffer)
;; ________________________________________
(require 'ivy)
(ivy-mode 1)

;; Package: company (complete anything)
;; ________________________________________
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(setq company-require-match nil)

;; Package: ibuffer-vc
;; ________________________________________
(require 'ibuffer-vc)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))
