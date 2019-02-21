;; Total User Startup Time: 0.240sec
(defvar my-init-load-start (current-time))
(setq custom-file "~/.custom.el")
(if (file-exists-p custom-file)
    (load custom-file))
(set-language-environment "UTF-8")
(setq gc-cons-threshold (* 50 1000 1000))
(setq shell-file-name "/usr/bin/sh")

(when (file-exists-p "~/.emacs.local")
   (load-file "~/.emacs.local"))
;; (set-frame-font "InputMono Nerd Font 9" nil t)
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
	(load-theme 'dracula t)
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
	:init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  ;; (use-package evil-commentary
  ;;   :ensure t
  ;;   :config
  ;;   (evil-commentary-mode)
  ;;   (general-define-key
	;; 	 :states '(normal insert)
	;; 	 "C-a" 'evil-commentary-line
	;; 	 )
	;; 	)

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


(use-package evil-collection
	:after evil
	:ensure t
	:config
	(evil-collection-init)
	)

;; (use-package helm
;; 	:ensure t
;; 	:config
;;   (helm-mode 1)
;; 	)
;; ;; Project Interaction Library for Emacs
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
	(setq projectile-git-submodule-command nil)
	(use-package ag
		:ensure t
		)
  ;; (setq projectile-completion-system 'helm)
	;; (setq projectile-indexing-method 'alien)
  )

;; Ido
(use-package ido-vertical-mode
	:ensure t
	)
(use-package ido-yes-or-no
	:ensure t
	)
(use-package flx-ido
	:ensure t
	)


(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
(setq ido-vertical-show-count nil)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)

(general-define-key
 ;; :states '(normal)
 :keymaps '(ido-buffer-completion-map ido-common-completion-map)
 ;; :keymaps '(ido-completion-map)
 "C-j" 'ido-next-match
 "C-k" 'ido-prev-match
 )

(general-define-key
 ;; :states '(normal)
 :keymaps 'minibuffer-local-map
 ;; :keymaps '(ido-completion-map)
 "<escape>" 'keyboard-escape-quit
 )

;; (ido-mode 1)
;; (ido-everywhere t)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point 'guess)
;; (defun bind-ido-keys ()
;;   "Keybindings for ido mode."
;;  	(general-define-key
;;  	 :keymaps 'ido-completion-map
;;  	 "ESC" 'ido-next-match
;;  	 )

;; (add-hook 'ido-setup-hook #'bind-ido-keys)

;; ;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands
;; (use-package counsel
;;   :ensure t
;;   :config
;;   (general-define-key
;;    "M-x" 'counsel-M-x
;;    ;; "M-y" 'counsel-yank-pop
;;    ;; "C-x C-f" 'counsel-find-file
;;    ;; "C-h v" 'counsel-describe-variable
;;    ;; "C-h f" 'counsel-describe-function
;;    ;; "C-x 8" 'counsel-unicode-char
;;    "<escape>" 'minibuffer-keyboard-quit
;;    )
;;   )

;; Ivy, a generic completion mechanism for Emacs.
;; (use-package ivy
;;   :ensure t
;;   :diminish ivy-mode
;;   :config
;;   (ivy-mode t)
;;   (setq ivy-initial-inputs-alist nil)
;;   (setq ivy-height 8)
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-virtual-abbreviate 'full)
;; 	(load "~/ivy-filthy-rich.el")
;; 	(require 'ivy-filthy-rich)
;; 	(ivy-filthy-rich-mode)
;;   (general-define-key
;;    :keymaps 'ivy-minibuffer-map
;;    "RET" 'ivy-alt-done
;;    "C-j" 'ivy-next-line
;;    "C-k" 'ivy-previous-line
;; 	 "C-p" 'ivy-previous-history-element
;; 	 "C-n" 'ivy-next-history-element
;;    )
;;   )




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
	(feebleline-show-git-branch             nil)
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
 	(setq neo-window-width 25)
 	(setq neo-click-changes-root nil)
 	(setq neo-auto-indent-point t)
 	(setq neo-hide-cursor nil)
 	(setq neo-show-updir-line t)
 	(setq neo-mode-line-type 'none)
 	(setq neo-banner-message nil)
 	;; (setq neo-vc-integration '(face char))
 	(setq neo-vc-integration nil)
 	(setq neo-autorefresh nil)
  (setq projectile-switch-project-action 'neotree-projectile-action)
	(defun neotree-startup ()
		(interactive)
		(neotree-show)
		(call-interactively 'other-window))

	(if (daemonp)
			(add-hook 'server-switch-hook #'neotree-startup)
		(add-hook 'after-init-hook #'neotree-startup)
		)
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
 	;; (defun neotree-project-dir ()
  ;;   "Open NeoTree using the git root. <- BUG C-p"
  ;;   (interactive)
  ;;   (let ((project-dir (projectile-project-root))
  ;;         (file-name (buffer-file-name)))
  ;;     (neotree-toggle)
  ;;     (if project-dir
  ;;         (if (neo-global--window-exists-p)
  ;;             (progn
  ;;               (neotree-dir project-dir)
  ;;               (neotree-find file-name)))
  ;;       (message "Could not find git project root."))))
  ;; (add-hook 'dired-mode-hook #'neotree-project-dir)

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
			(set (make-local-variable 'company-backends) '((company-go company-yasnippet)))
			(company-mode)
			)
		(add-hook 'go-mode-hook #'setup-company-go)
		)
	)
;; COMPANY-ETAGS POUR CSS SCSS
;; (eval-after-load 'company-etags '(progn (add-to-list 'company-etags-modes '(web-mode typescript-mode ng2-html-mode))))
;; (setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode typescript-mode ng2-html-mode))

(use-package flycheck
	:ensure t
	:init (global-flycheck-mode)
	:config
	(add-hook 'after-init-hook #'global-flycheck-mode)
	)

;; ##################### WEB MODE #############################
(use-package web-mode
	:ensure t
	:config
	;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\component\.html?\\'" . ng2-mode))
	;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
	;; (add-to-list 'auto-mode-alist '("\\.ts?\\'" . typescript-mode))
	(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.gohtml?\\'" . web-mode))
	;; (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
	(setq web-mode-enable-auto-pairing t)
	(setq web-mode-enable-auto-opening t)
	(setq web-mode-enable-auto-closing t)
	(setq web-mode-enable-auto-quoting nil)
	(setq web-mode-enable-css-colorization t)
	(setq web-mode-enable-current-element-highlight t)
	(setq web-mode-comment-style 2)
	(setq web-mode-attr-indent-offset config-offset)
	(setq web-mode-markup-indent-offset config-offset)
	(setq web-mode-code-indent-offset config-offset)
	(setq web-mode-css-indent-offset config-offset)
	(setq sgml-basic-offset config-offset)
	(setq sgml-attribute-offset config-offset)

	;; ###### TSX
	(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
	(add-hook 'web-mode-hook
						(lambda ()
							(when (string-equal "tsx" (file-name-extension buffer-file-name))
								(setup-tide-mode))))
	;; enable typescript-tslint checker
	(flycheck-add-mode 'typescript-tslint 'web-mode)

	(defadvice web-mode-highlight-part (around tweak-jsx activate)
		(if (equal web-mode-content-type "jsx")
				(let ((web-mode-enable-part-face nil))
					ad-do-it)
			ad-do-it))

	;; (defun my-web-mode-hook ()
	;; 	"Hooks for Web mode."
	;; 	)
	;; (add-hook 'web-mode-hook  #'my-web-mode-hook)
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
		;; (tide-hl-identifier-mode +1)
		(company-mode +1)
		;; (set (make-local-variable 'company-backends) '((company-files company-tide company-dabbrev company-gtags company-etags company-keywords)))
		(set (make-local-variable 'company-backends) '((company-tide company-files company-yasnippet)))
		)
	;; aligns annotation to the right hand side
	(setq company-tooltip-align-annotations t)
	;; formats the buffer before saving
	;; (add-hook 'before-save-hook 'tide-format-before-save)
	(add-hook 'typescript-mode-hook #'setup-tide-mode)
	)


;; ###### Enable les modules de checkers avant
;; (setq flycheck-checker nil)
(add-to-list 'flycheck-checkers 'javascript-tide)
(add-to-list 'flycheck-checkers 'jsx-tide)


;; ####### Javascript
;; (add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

;; ####### JSX
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "jsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; ;; configure jsx-tide checker to run after your default jsx checker
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; ######### KOTLIN
;; (load "~/dev/github/kotlin-mode/kotlin-mode.el")
;; (require 'kotlin-mode)
;; (setq kotlin-tab-width 2)
;; (add-to-list 'auto-mode-alist '("\\.kt\\'" . kotlin-mode))

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

(use-package yaml-mode
	:ensure t
	:config
	)

;; COPIER COLLER
(use-package xclip
	:ensure t
	:config
	(xclip-mode 1)
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
	(defun setup-company-ng2 ()
		(company-mode +1)
		(set (make-local-variable 'company-backends) '((company-dabbrev company-dabbrev-code company-gtags company-etags company-keywords)))
		)
	(add-hook 'ng2-html-mode-hook #'setup-company-ng2)
	)



(use-package emmet-mode
	:ensure t
	:config
	(setq emmet-self-closing-tag-style "")
	(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
	(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
	)

;; (use-package folding
;; 	:ensure t
;; 	:config
;; 	(load "folding" 'nomessage 'noerror)
;; 	(folding-mode-add-find-file-hook)
;; 	(folding-add-to-marks-list 'web-mode "<svg" "</svg>" nil t)
;; 	;; (folding-add-to-marks-list 'web-mode "<path" "/>" nil t)
;; 	(add-hook 'web-mode-hook (lambda ()
;; 														 (folding-mode)
;; 														 ))
;; 	)


;; (use-package hideshow-org
;; 	:ensure t
;; 	:config
;; 	(add-hook 'prog-mode-hook #'hs-minor-mode)
;; 	)
;; (defvar hs-special-modes-alist
;;   (mapcar 'purecopy
;; 					'((c-mode "{" "}" "/[*/]" nil nil)
;; 						(c++-mode "{" "}" "/[*/]" nil nil)
;; 						(bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
;; 						(java-mode "{" "}" "/[*/]" nil nil)
;; 						(js-mode "{" "}" "/[*/]" nil))
;; 					)
;; 	)


;; DIRED
(add-hook 'dired-mode-hook 'dired-hide-details-mode)



;; (use-package restclient
;; 	:ensure t
;; 	:config
;; 	(setq json-reformat:indent-width config-offset)
;; 	(setq json-reformat:pretty-string? nil)
;; 	)

;; (general-define-key
;;  :states 'normal
;;  :keymaps '(restclient-mode-map)
;;  "RET" 'restclient-http-send-current
;;  )


;; COMMENTAIRES
(setq comment-multi-line nil)
(general-define-key
 :states '(normal insert)
 "C-a" 'comment-line
 )

(use-package yasnippet
	:ensure t
	:config
	(setq yas-snippet-dirs
				'("~/.snippets"                 ;; personal snippets
					;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
					;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
					))
	(yas-global-mode 1)
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
 ;; "§" 'switch-to-buffer
 "C-h" 'evil-window-left
 "C-j" 'evil-window-down
 "C-k" 'evil-window-up
 "C-l" 'evil-window-right
 "C-q" 'evil-quit
 "<f3>" 'flycheck-next-error
 "C-<f3>" 'flycheck-previous-error
 "M-f" 'counsel-ag
 "C-@" 'company-complete-common
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
 ;; "SPC" 'switch-to-buffer
 "SPC" 'ido-switch-buffer
 "b" '(:ignore t :which-key "Buffers")
 "l" 'switch-to-next-buffer
 "h" 'switch-to-prev-buffer
 "bb" 'switch-to-buffer
 "t" 'folding-toggle-show-hide
 ;; "ee" 'eval-last-sexp
 ;; "en" 'nodejs-repl
 "f" '(:ignore t :which-key "Files")
 "ff" 'projectile-ag
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
;; BINDS FOR WEB MODE
(general-define-key
 :keymaps 'web-mode-map
 :states '(normal)
 "gd" 'tide-jump-to-definition
 "<f2>" 'tide-rename-symbol
 "<f9>" 'tide-documentation-at-point
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
 ;; "q" nil
 "q" 'evil-delete-buffer
 )
(general-define-key
 :keymaps 'evil-insert-state-map
 "C-e" 'emmet-expand-line
 )


;; MODES
(global-linum-mode 0)
(global-hl-line-mode 1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)
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
;; (setq select-enable-clipboard t)
;; (setq select-enable-primary nil)
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

;; WINDOW DIVIDER !!
(defun my-change-window-divider ()
  (let ((display-table (or buffer-display-table standard-display-table)))
    (set-display-table-slot display-table 5 ?│)
    (set-window-display-table (selected-window) display-table)))

(add-hook 'window-configuration-change-hook 'my-change-window-divider)

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
;; (setq-default message-log-max nil)
;; (kill-buffer "*Messages*")
(setq gc-cons-threshold (* 2 1000 1000))

;; Display the time taken to start Emacs.
(let ((my-init-time (time-to-seconds (time-since my-init-load-start))))
  (add-hook 'after-init-hook
            `(lambda ()
               (message "Init time was %.2fs (%.2fs in %s)."
                        (time-to-seconds (time-since before-init-time))
                        ,my-init-time
                        (file-name-nondirectory user-init-file)))))

;; #################### END #######################

