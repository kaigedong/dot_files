(tool-bar-mode -1) ;; 关闭状态栏
(scroll-bar-mode -1) ;; 关闭文件滑动控件
(global-hl-line-mode 1) ;; 高亮当前行，更容易找到光标位置
(global-display-line-numbers-mode t) ;; 显示行号
(setq-default cursor-type 'bar) ;; 更改光标样式
(set-face-attribute 'default nil :height 160) ;; 更改字体大小 16pt
;; 让鼠标滚动更好用
;;(setq mouse-wheel-scroll-amount '(1 ((shift) .1) ((control) . nil)))
;;(setq mouse-wheel-progressive-speed nil)

(package-install 'monokai-theme)
(load-theme 'monokai 1)

(provide 'init-ui)
