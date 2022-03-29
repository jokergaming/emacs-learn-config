;; 设置编码解决乱码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 设置垃圾回收阈值，加速启动速度
;; 设置为最大值
(setq gc-cons-threhold most-positive-fixnum)

;; 正数开，负数和0关
(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

;; 关闭启动banner
;; inhibit是抑制的意思
(setq inhibit-startup-screen t)

(provide 'init-startup)
