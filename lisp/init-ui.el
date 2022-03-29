;; 主题
(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

;; 状态栏主题，必须放在主题配置之下，才可以根据当前
;; 主题自动变换色调
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))



;; windows字体渲染解决卡顿
(use-package emacs
  :if (display-graphic-p) ;; 如果是图形界面才进行配置
  :config
  (if *is-windows*
    (progn ;; progn可以连接语句，if只能接一条，所以需要progn连接
      (set-face-attribute 'default nil :font "Microsoft Yahei Mono 9")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset (font-spec :family "Microsoft Yahei Mono" :size 12))))
    ;; else
    (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))


;; 开启相对行号
(setq display-line-numbers-type 'relative)
;; 不是windows才开启，Windows开启会屏幕闪烁
(unless *is-windows*
  (global-display-line-numbers-mode t))


(provide 'init-ui)
