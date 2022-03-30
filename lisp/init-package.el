;; init-package.el -- settings for packages

;; 测试启动耗时
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; 删除当前行等一些智能编辑体验
(use-package crux
  :bind (("C-a"   . crux-move-beginning-of-line) ;; 移动到行首，再次移动可以到第一个字符处
	 ("C-c ^" . crux-top-join-line) ;; 快速连接两行
	 ("C-x ," . crux-find-user-init-file) ;; 快速转到配置文件
	 ("C-S-d" . crux-duplicate-current-line-or-region) ;; 快速复制当前行或者区域
	 ("C-S-k" . crux-smart-kill-line))) ;; 快速删除行


;; 一次性删除所有空白字符
(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c d" . hungry-delete-forward)))

;; 上下移动代码块
(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))


;; 强化搜索三剑客 ivy+counsel+swiper

(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  ;; (ivy-posframe-mode 1)
  )

;; 显示minibuffer在中间而不是最下面
(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist
	'((swiper            .ivy-posframe-display-at-frame-center)
	  (complete-symbol   .ivy-posframe-display-at-point)
	  (counsel-M-x       .ivy-posframe-display-at-frame-center)
	  (counsel-find-file .ivy-posframe-display-at-frame-center)
	  (ivy-switch-buffer .ivy-posframe-display-at-frame-center)
	  (t                 .ivy-posframe-display-at-frame-center))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))


;; company补全设置
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-other-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minium-prefix-length 2
	company-show-numbers t
	company-tooltip-limit 20
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))


;; 语法检查
(use-package flycheck
  :hook (after-init . global-flycheck-mode)) ;; 全局启用

;; (use-package flycheck
;;  :hook (prog-mode . flycheck-mode)) ;; 只在编程语言模式启用


;; 记忆快捷键
(use-package which-key
  :defer nil
  :config (which-key-mode))


;; 分屏切换
(use-package ace-window
  :bind (("M-o" . "ace-window")))


;; lsp设置
(use-package lsp-mode
  ;; add prog-mode to lsp instead of adding one by one
  ;; :hook ((prog-mode . (lsp-deferred))
  ;; (lsp-mode . lsp-enable-which-key-integration))
  
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (python-mode . lsp-deferred)
	 (haskell-mode . lsp-deferred)
	 (html-mode   . lsp-deferred))
  :commands (lsp lsp-deferred)
  :init (setq lsp-prefer-flymake nil ;; not use flymake instead flycheck
	      lsp-keep-workspace-alive nil ;; auto kill lsp server
	      lsp-enable-indentation t
	      lsp-enable-on-type-formatting nil
	      lsp-auto-guess-root t
	      lsp-auto-configure t
	      lsp-enable-snippet t)
  :config
  (use-package lsp-clients
    :ensure nil
    :functions (lsp-format-buffer lsp-organize-imports)))

(use-package lsp-ui
  :after (lsp-mode)
  :commands (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-references] . lsp-ui-peek-find-references)
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	("C-c u" . lsp-ui-imenu))
  :hook (lsp-mode . lsp-ui-mode)
  :init
  (setq lsp-enable-symbol-highlighting t
	lsp-ui-doc-enable t
	lsp-lens-enable t))



;; paredit设置-- 用于lisp语言家族

(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
  ;; (diminish 'paredit-mode "()")
  )

;; modeline显示按键和命令
(use-package keycast
  :init
  (add-to-list 'global-mode-string '("" mode-line-keycast))
  (keycast-mode))

;; 增强minibuffer补全
(use-package vertico
  :init
  (vertico-mode))

(define-key vertico-map "?" #'minibuffer-completion-help)
(define-key vertico-map (kbd "M-RET") #'minibuffer-force-complete-and-exit)
(define-key vertico-map (kbd "M-TAB") #'minibuffer-complete)


;; 无序补全
(use-package orderless
  :init
  (setq completion-styles '(substring orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package savehist
  :init
  (savehist-mode))


(use-package emacs
  :init
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
  
  (setq minibuffer-prompt-properties
	'(read-only t cursor-intangible t face minibuffer-prompt))
  
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  
  (setq enable-recursive-minibuffers t))



;; 重启emacs的包
(use-package restart-emacs)


(provide 'init-package)
