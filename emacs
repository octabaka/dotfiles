(set-language-environment "UTF-8")
(set-frame-font "InputMono Nerd Font 9" nil t)
(setq url-proxy-services '(
													 ("no_proxy" . "127.0.0.1")
													 ("no_proxy" . "localhost")
													 ("http" . "192.168.1.100:3128")
													 ))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)
;; CUSTOM VARIABLES
(defvar config-offset 2)
;;
(defalias 'yes-or-no-p 'y-or-n-p)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

(use-package general
  :ensure t)

(use-package dracula-theme
  :ensure t
  :config
	(custom-set-faces
	 '(default ((t (:background "black" :foreground "#ffffff"))))
	 '(font-lock-comment-face ((t (:inherit (shadow default) :foreground "#444444"))))
	 '(linum ((t (:inherit (shadow default) :background "black" :foreground "#586e75"))))
	 '(region ((t (:inherit (shadow default) :background "red"))))
	 '(hl-line ((t (:background "#090909" :foreground nil))))
	 '(mode-line ((t (:background "#090909" :foreground nil))))
	 '(feebleline-linum-face ((t (:foreground "#ffff00"))))
	 '(neo-vc-ignored-face ((t (:foreground "#202020"))))
	 ;; '(feebleline-previous-buffer-face ((t (:background "#010101" :foreground nil))))
	 ;; '(feebleline-dir-face ((t (:background "#090909" :foreground nil))))
	 )
  )


(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-commentary
    :ensure t
    :config
    (evil-commentary-mode)
    (general-define-key
		 :states '(normal insert)
		 "C-a" 'evil-commentary-line
		 )
		)

  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1)
    )
  ;; (use-package evil-escape
  ;;   :ensure t
  ;;   :config
  ;;   (evil-escape-mode 1)
  ;;   ;; (setq-default evil-escape-key-sequence "fj")
  ;;   (setq-default evil-escape-delay 0.2))

  ;; (use-package evil-leader
  ;;   :ensure t
  ;;   :config
  ;;   (global-evil-leader-mode)
  ;;   )

  ;; (use-package evil-indent-textobject
  ;;   :ensure t)
  )


;; Project Interaction Library for Emacs
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
	;; (setq projectile-indexing-method 'alien)
  )


;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands
(use-package counsel
  :ensure t
  :config
  (general-define-key
   "M-x" 'counsel-M-x
   ;; "M-y" 'counsel-yank-pop
   ;; "C-x C-f" 'counsel-find-file
   ;; "C-h v" 'counsel-describe-variable
   ;; "C-h f" 'counsel-describe-function
   ;; "C-x 8" 'counsel-unicode-char
   "<escape>" 'minibuffer-keyboard-quit
   )
  )

;; Ivy, a generic completion mechanism for Emacs.
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode t)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-height 8)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-virtual-abbreviate 'full)
	(load "~/ivy-filthy-rich.el")
	(require 'ivy-filthy-rich)
	(ivy-filthy-rich-mode)
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "RET" 'ivy-alt-done
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line
	 "C-p" 'ivy-previous-history-element
	 "C-n" 'ivy-next-history-element
   )
  )




(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; ############### MODELINEEEEEEEEEEEEEEE
;; (use-package telephone-line
;;   :ensure t
;;   :config
;; 	(setq telephone-line-lhs
;; 				'((evil   . (telephone-line-evil-tag-segment))
;; 					(evil . (telephone-line-buffer-modified-segment))
;; 					(accent . (
;; 										 telephone-line-vc-segment
;; 										 telephone-line-erc-modified-channels-segment
;; 										 telephone-line-process-segment
;; 										 ))
;; 					(nil    . (
;; 										 telephone-line-projectile-buffer-segment
;; 										 telephone-line-process-segment
;; 										 ))
;; 					))
;; 	(setq telephone-line-rhs
;; 				'((nil    . (telephone-line-misc-info-segment))
;; 					(accent . (telephone-line-major-mode-segment))
;; 					(evil   . (telephone-line-airline-position-segment))
;; 					(accent   . (telephone-line-flycheck-segment))
;; 					)
;; 				)
;;   (telephone-line-mode 1)
;;   )
(use-package    feebleline
  :ensure       t
  :custom
	(feebleline-show-git-branch             t)
  (feebleline-show-dir                    t)
  (feebleline-show-time                   nil)
  (feebleline-show-previous-buffer        nil)
  :config
	(feebleline-mode 1)
	(feebleline-default-settings-on)
	)


;; ################################################


(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
 	(setq neo-theme 'arrow)
 	(setq neo-window-fixed-size nil)
 	(setq neo-window-width 30)
 	(setq neo-click-changes-root nil)
 	(setq neo-auto-indent-point t)
 	(setq neo-hide-cursor nil)
 	(setq neo-show-updir-line nil)
 	(setq neo-mode-line-type 'none)
 	(setq neo-banner-message nil)
 	(setq neo-vc-integration '(face char))
 	(setq neo-autorefresh nil)
  (setq projectile-switch-project-action 'neotree-projectile-action)
 	(general-define-key
 	 :states 'normal
 	 :keymaps '(neotree-mode-map)
 	 "y" 'neotree-copy-node
 	 "c" 'neotree-create-node
   "d" 'neotree-delete-node
   ;; "SPC" 'neotree-quick-look
   "q" 'neotree-hide
   "RET" 'neotree-enter
   "r" 'neotree-refresh
   "m" 'neotree-rename-node
   "A" 'neotree-stretch-toggle
   ;; "H" 'neotree-hidden-file-toggle
   "H" 'neotree-change-root
   "DEL" 'neotree-select-up-node
 	 )
 	(general-define-key
 	 :keymaps 'evil-normal-state-map
 	 "-" 'neotree-toggle
 	 )
 	(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
  (add-hook 'dired-mode-hook #'neotree-project-dir)

  )


;; Modular in-buffer completion framework for Emacs
(use-package company
	:ensure t
	:config
	(global-company-mode)
	(setq company-idle-delay 0.1)
	(setq company-tooltip-limit 10)                      ; bigger popup window
	(setq company-selection-wrap-around t)
	(setq company-echo-delay 0)                          ; remove annoying blinking
	(setq company-minimum-prefix-length 2)
	;; (company-tng-configure-default)
	(general-define-key
	 :keymaps 'company-active-map
	 "TAB" 'company-complete
	 "C-j" 'company-select-next
	 "C-k" 'company-select-previous
	 )

	(use-package company-go
		:ensure t
		:config
		(defun setup-company-go ()
			(set (make-local-variable 'company-backends) '((company-go)))
			(company-mode)
			)
		(add-hook 'go-mode-hook #'setup-company-go)
		)
	)
(use-package flycheck
	:ensure t
	:init (global-flycheck-mode)
	:config
	(add-hook 'after-init-hook #'global-flycheck-mode)
	)

;; TypeScript Interactive Development Environment for Emacs
(use-package tide
	:ensure t
	:after (typescript-mode company flycheck)
	:config
	(defun setup-tide-mode ()
		(interactive)
		(tide-setup)
		(flycheck-mode +1)
		(setq flycheck-check-syntax-automatically '(save mode-enabled))
		(eldoc-mode +1)
		(tide-hl-identifier-mode +1)
		(company-mode +1)
		(set (make-local-variable 'company-backends) '((company-files company-tide)))
		)
	;; aligns annotation to the right hand side
	(setq company-tooltip-align-annotations t)
	;; formats the buffer before saving
	;; (add-hook 'before-save-hook 'tide-format-before-save)
	(add-hook 'typescript-mode-hook #'setup-tide-mode)
	)


(use-package go-mode
	:ensure t
	:config
	)
;; BUG du binaire gorename qui supporte pas les modules
(use-package go-rename
	:ensure t
	:config
	)
(use-package go-eldoc
	:ensure t
	:config
	(add-hook 'go-mode-hook 'go-eldoc-setup)
	)

(use-package json-mode
	:ensure t
	:config
	)
;; (use-package yaml-mode
;; 	:ensure t
;; 	:config
;; 	(add-hook 'yaml-mode-hook
;; 						(lambda ()
;; 							(define-key yaml-mode-map "\C-m" 'newline-and-indent)))
;; 	)


;; (use-package dashboard
;; 	:ensure t
;; 	:diminish dashboard-mode
;; 	:config
;; 	;; (setq dashboard-banner-logo-title "Emacs Rox :-)")
;; 	;; (setq dashboard-startup-banner nil)
;; 	(setq dashboard-items '((projects  . 10)
;; 													(bookmarks . 10)))
;; 	(dashboard-setup-startup-hook)
;; 	(general-define-key
;; 	 :states 'normal
;; 	 :keymaps '(dashboard-mode-map)
;; 	 "j" 'dashboard-next-section
;; 	 "k" 'dashboard-previous-section
;; 	 )
;; 	)

(use-package ng2-mode
	:ensure t
	:config
	)

(use-package web-mode
	:ensure t
	:config
	;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\component\.html?\\'" . ng2-mode))
	(add-to-list 'auto-mode-alist '("\\.ts?\\'" . typescript-mode))
	(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.gohtml?\\'" . web-mode))
	;; (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
	(setq web-mode-enable-auto-pairing t)
	(setq web-mode-enable-auto-opening t)
	(setq web-mode-enable-auto-closing t)
	(setq web-mode-enable-auto-quoting t)
	(setq web-mode-enable-css-colorization t)
	(setq web-mode-enable-current-element-highlight t)
	(setq web-mode-comment-style 2)
	(setq web-mode-attr-indent-offset config-offset)
	(setq web-mode-markup-indent-offset config-offset)
	(setq web-mode-code-indent-offset config-offset)
	(setq web-mode-css-indent-offset config-offset)
	(setq sgml-basic-offset config-offset)
	(setq sgml-attribute-offset config-offset)

	(defadvice web-mode-highlight-part (around tweak-jsx activate)
		(if (equal web-mode-content-type "jsx")
				(let ((web-mode-enable-part-face nil))
					ad-do-it)
			ad-do-it))

	(defun my-web-mode-hook ()
		"Hooks for Web mode."
		)
	(add-hook 'web-mode-hook  #'my-web-mode-hook)
	)


(use-package emmet-mode
	:ensure t
	:config
	(setq emmet-self-closing-tag-style "")
	(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
	(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
	)
(use-package folding
	:ensure t
	:config
	(load "folding" 'nomessage 'noerror)
	(folding-mode-add-find-file-hook)
	(folding-add-to-marks-list 'web-mode "<svg" "</svg>" nil t)
	(add-hook 'web-mode-hook (lambda ()
														 (folding-mode)
														 ))
	)
;; DIRED
(add-hook 'dired-mode-hook 'dired-hide-details-mode)



(use-package restclient
	:ensure t
	:config
	(setq json-reformat:indent-width config-offset)
	(setq json-reformat:pretty-string? nil)
	)
(general-define-key
 :states 'normal
 :keymaps '(restclient-mode-map)
 "RET" 'restclient-http-send-current
 )


;; ############  GLOBAL Functions #####################
(defun iwb ()
	"indent whole buffer"
	(interactive)
	(delete-trailing-whitespace)
	(indent-region (point-min) (point-max) nil)
	;; (untabify (point-min) (point-max))
	)

;; Global Keys
(general-define-key
 "M-s" 'save-buffer
 "<f5>" 'iwb
 "§" 'switch-to-buffer
 "C-h" 'evil-window-left
 "C-j" 'evil-window-down
 "C-k" 'evil-window-up
 "C-l" 'evil-window-right
 "C-q" 'evil-quit
 "<f3>" 'flycheck-next-error
 "C-<f3>" 'flycheck-previous-error
 "M-f" 'counsel-ag
 )

;; NAVIGATION
(general-define-key
 :prefix "t"
 :keymaps '(normal visual dired-mode-map web-mode)
 "" '(nil :which-key "Navigation des Buffers")
 "l" 'evil-next-buffer
 "h" 'evil-prev-buffer
 "q" 'evil-delete-buffer
 )

;; SPACE LEADER
(general-define-key
 :prefix "SPC"
 :keymaps '(normal visual dired-mode-map web-mode)
 "" '(nil :which-key "Prefix Général")
 "SPC" 'switch-to-buffer
 "b" '(:ignore t :which-key "Buffers")
 "l" 'switch-to-next-buffer
 "h" 'switch-to-prev-buffer
 "bb" 'switch-to-buffer
 "t" 'folding-toggle-show-hide
 ;; "ee" 'eval-last-sexp
 ;; "en" 'nodejs-repl
 "f" '(:ignore t :which-key "Files")
 "ff" 'counsel-ag
 "g" '(:ignore t :which-key "Files")
 "gd" 'godef-jump
 "gi" 'go-import-add
 "p" '(:ignore t :which-key "Projects")
 "pf" 'projectile-find-file
 "pp" 'projectile-switch-project
 "q" '(:ignore t :which-key "Quit & Save")
 "qq" 'save-buffers-kill-emacs
 )

;; BINDS FOR GO MODE
(general-define-key
 :keymaps 'go-mode-map
 :states '(normal)
 "gd" 'godef-jump
 "<f2>" 'go-rename
 "<f9>" 'godoc-at-point
 )

;; BINDS FOR TYPESCRIPT
(general-define-key
 :keymaps 'typescript-mode-map
 :states '(normal)
 "gd" 'tide-jump-to-definition
 "<f2>" 'tide-rename-symbol
 "<f9>" 'tide-documentation-at-point
 )

(general-define-key
 :keymaps 'evil-normal-state-map
 "C-p" 'projectile-find-file
 "q" nil
 )
(general-define-key
 :keymaps 'evil-insert-state-map
 "C-e" 'emmet-expand-line
 )


;; MODES
(global-linum-mode 0)
(global-hl-line-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(visual-line-mode 1)
(save-place-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

;; VARS
(setq make-backup-files nil)
;; DISABLE LOCK FILES
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq linum-format "%d ")
(setq require-final-newline t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode t)
(setq-default tab-width config-offset)
(setq js-indent-level config-offset)
(setq typescript-indent-level config-offset)

(setq indent-line-function 'insert-tab)
(setq truncate-partial-width-windows nil)
(setq ring-bell-function 'ignore)
(setq display-time-mode nil)
(setq select-enable-clipboard t)
;; scroll one line at a time (less "jumpy" than defaults)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq redisplay-dont-pause t
			scroll-margin 4
			scroll-step 1
			scroll-conservatively 10000
			scroll-preserve-screen-position 1
			)

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
;; (setq-default message-log-max nil)
;; (kill-buffer "*Messages*")


;; #################### END #######################

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(yaml-mode which-key web-mode use-package tide restclient projectile ov ng2-mode neotree json-mode go-rename go-eldoc general folding feebleline evil-surround evil-matchit evil-commentary emmet-mode dracula-theme dash-functional counsel company-go))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(feebleline-linum-face ((t (:foreground "#ffff00"))))
 '(font-lock-comment-face ((t (:inherit (shadow default) :foreground "#444444"))))
 '(hl-line ((t (:background "#090909" :foreground nil))))
 '(linum ((t (:inherit (shadow default) :background "black" :foreground "#586e75"))))
 '(mode-line ((t (:background "#090909" :foreground nil))))
 '(neo-vc-ignored-face ((t (:foreground "#202020"))))
 '(region ((t (:inherit (shadow default) :background "red")))))
