;; emacs 的按键符号：
;; M(eta): 是左windows键
;; s(uper): 是left Alt键
;; S(hift)
;; C(trl): 改成CapsLock更健康

;; 快捷键
;; C-h m:   显示当前开启的全部Minor Mode的信息
;; C-h C-f: `find-function`
;; C-h C-v: `find-variable`
;; C-h C-k: `find-function-on-key`
;; M-x customize-group 后，选择对应的插件名称，可以进入可视化选项区对指定的a插件做自定义设置。

;; setq 设置当前缓冲区（Buffer）中的值，setq-default设置为全局变量的值
;; 下面两行效果完全相同
;; (quote foo)
;; 'foo
;; quote 的意思是不要执行后面的内容，返回它原本的内容

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;;
(require 'init-packages)
(require 'init-keybindings)
(require 'init-ui)
(require 'custom)


;; 其他配置
(icomplete-mode 1) ;; 这个模式可以在M-x的时候进行命令提示

;; 下面的配置可以加入最近打开过的文件的选项，让我们更快的在图形界面菜单中打开最近编辑过的文件
(require 'recentf) ;; require的意思是从文件中加载特性。
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;modeline上显示所有的按键和执行的命令
;;(package-install 'keycast)
;;(keycast-mode-line-mode t)

;;(package-install 'awesome-tab)
;;(awesome-tab-mode t)

;; 增强minibuffer补全：vertico和Orderless
(package-install 'vertico)
(vertico-mode t)

(package-install 'orderless)
(setq completion-styles '(orderless))

;; 配置Marginalia增强minibuffer的annotation
(package-install 'marginalia)
(marginalia-mode t)


;;只安装 embark-act 和 consult，会有warning
(package-install 'embark-consult)

;; minibuffer action和自适应的context menu: Embark
(package-install 'embark)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

;; 增强文件内搜索和跳转函数定义: Consult
(package-install 'consult)
;;replace swiper
(global-set-key (kbd "C-s") 'consult-line)
;; consult-imenu


(package-install 'company)
(global-company-mode 1) ;; 开启全局Company补全
;; company mode 默认选择上一条和下一条候选命令 M-n M-p
(define-key company-active-map (kbd "C-n") 'conpany-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; 下面是通过options--Manage Emacs packages安装company的时候自动生成的...
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default))
 '(package-selected-packages
   '(monokai-theme nord-theme doom-nord awesome-tab awosome-tab consult embark embark-consult marginalia orderless vertico keycast company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
