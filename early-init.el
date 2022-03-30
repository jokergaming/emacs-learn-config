;;; early-init.el --- emacs 27 之后用于在init之前的配置

;;; Commentary:
;; emacs 27+ 在`package-initialize`之前加载这个文件


;;; Code:

(setq package-enable-at-startup nil)

(provide 'early-init)
