;;; Compiled snippets and support files for `latex-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
                     '(("myfig" "\\myfig{${1:path to filename}}\n      {}\n      {width=${2:width}\\textwidth}\n      {${3:short caption}}\n      {$3: ${4:long caption}}\n      {fig:${5:${$3}}}\n$0" "myfig" nil nil nil "/home/luis/.emacs.d/snippets/latex-mode/myfig" nil nil)
                       ("LV" "%%% Local Variables:\n%%% mode: latex\n%%% mode: auto-fill\n%%% mode: flyspell\n%%% TeX-master: \"../main\"\n%%% eval: (ispell-change-dictionary \"german\")\n%%% eval: (flyspell-buffer)\n%%% End:\n$0" "Local Variables" nil nil nil "/home/luis/.emacs.d/snippets/latex-mode/Local_Variables" nil nil)))


;;; Do not edit! File generated at Thu Aug 29 16:00:51 2019
