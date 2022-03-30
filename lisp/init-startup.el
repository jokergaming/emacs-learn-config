;; 设置编码解决乱码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 设置垃圾回收阈值，加速启动速度
;; 设置为最大值
(setq gc-cons-threhold most-positive-fixnum)


;; 不备份
(setq make-backup-files nil)

;; 禁止autosave文件
(setq auto-save-default nil)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭警告声
(setq ring-bell-function 'ignore)

;; 禁止生成#开头的文件(lock file)
;; (setq create-lockfiles nil)

;; 开启服务器模式，可以直接Windows右键打开
;; (server-mode 1)

;; 鼠标滚动优化
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)


;; 正数开，负数和0关
(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

;; 关闭启动banner
;; inhibit是抑制的意思
(setq inhibit-startup-screen t)

(provide 'init-startup)
