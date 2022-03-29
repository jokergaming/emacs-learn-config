;; mac键盘设置，command映射为meta
(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

;; y/n取代yes/no
(defalias 'yes-or-no-p 'y-or-n-p) ;; windows字体渲染解决卡顿


(provide 'init-kbd)
