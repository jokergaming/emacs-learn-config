;;; init.el --- 加载所有配置的顶层模块
;;; Commentary:

;; this file bootstrap the configuration, which is devided into
;; a number of other files.

;;; Code:

;; 调试用
(setq debug-on-error t)

;; 测试版本
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your emacs is old, try to upgrade"))


;; load-path是emacs引入模块的搜索路径, 把文件加进去emacs会去找
;; expand-file-name导入文件和文件夹，concat是拼接，最终会是.emacs.d/lisp下所有文件
(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "lisp")))



;; 设置图形界面或者内部配置文件的存放位置，避免污染init.el
;; 注意此时并未加载，后续需要load才生效
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;; 导入顺序很重要
(require 'init-const) ;; 常量
(require 'init-kbd) ;; 快捷键
(require 'init-startup) ;; 默认原生配置
(require 'init-elpa) ;; 包配置，镜像源配置
(require 'init-package) ;; 包管理
(require 'init-ui) ;; ui配置
(require 'awesome-pair) ;; 括号匹配插件
(require 'init-scheme)
(require 'init-pairconfig)

;; 加载custom配置
(when (file-exists-p custom-file)
  (load-file custom-file))
