(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;(setq latex-run-command "pdflatex")

;; This line tells emacs where to find the latex compiler
(setenv "PATH" (concat "/usr/local/texlive/2014/bin/x86_64-darwin/:" (getenv "PATH")))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

(setq TeX-source-correlate-method 'synctex)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (push
                              '("PDFLaTeX" "latexmk -pdf %s" TeX-run-TeX nil t
                                :help "Run latexmk on file")
                              TeX-command-list)))
;(add-hook 'LaTeX-mode-hook (lambda ()
;                             (push
;                              '("pdflatex" "pdflatex -synctex=1 %s" TeX-run-TeX nil t
;                                :help "Run pdflatex with SyncTex on file")
;                              TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "PDFLaTeX")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-list
           '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
