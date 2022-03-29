;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 软件源设置
(setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
			 ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")))
;; 不检查签名
(setq package-check-signature nil)

;; 使用emacs包管理器
(require 'package)

;; 初始化包管理器
(unless (bound-and-true-p package-initialized)
  (package-initialize))

;; 刷新软件源缓存
(unless package-archive-contents
  (package-refresh-contents))


;; 安装usepackage
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; usepackage配置
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

(require 'use-package)

(provide 'init-elpa)
