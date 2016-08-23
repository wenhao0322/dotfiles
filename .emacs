;; turn on org-mode for .org files
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; --------------------
;; Install Melpa
;; --------------------

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(require 'chinese-fonts-setup)

;;--------------------
;;Install Chinese Display
;;--------------------

;;;; 设置编辑环境
;; 设置为中文简体语言环境
(set-language-environment 'Chinese-GB)
;; 设置emacs 使用 utf-8
(setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录的中文名乱码
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)


(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat
                  "img/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
  ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
  ; insert into file if correctly taken
  (if (file-exists-p filename)
    (insert (concat "[[./" filename "]]"))))

;; set up octave-mode for .m files
(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

;; set up short key for gnuplot
(local-set-key "\M-\C-g" 'org-plot/gnuplot)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))
;; add additional languages with '((language . t)))

;; Initialize org Babel for Python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; initialize elpy
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set the line number for python
(defun my-c-mode-hook () 
  (linum-mode 1)) 
(add-hook 'c-mode-hook 'my-c-mode-hook) 

(defun my-python-mode-hook () 
  (linum-mode 1)) 
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; set the space between the line number and the code region
(unless (display-graphic-p)
    (setq linum-format "%d  "))

;; set emacs theme
(load-theme 'tango-dark)

;; set emacs smooth scrolling
(require 'smooth-scrolling)
(setq scroll-step            1
      scroll-conservatively  10000)

;; enable markdown mode
(autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Latex settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set Environment for LaTeX
 (getenv "PATH")
  (setenv "PATH"
 (concat
  "/opt/local/bin" ":"
 (getenv "PATH")))

;; enable latex-mode for .tex files
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq latex-run-command "pdflatex")
; Turn on RefTeX for AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
; Make RefTeX interact with AUCTeX
(setq reftex-plug-into-AUCTeX t)

;; enable automatic spell check for latex files
(setq ispell-program-name "hunspell")
(setq ispell-dictionary "english")

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
