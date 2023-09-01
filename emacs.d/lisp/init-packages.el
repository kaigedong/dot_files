(require 'package)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))


(package-install 'use-package) ;; Use-package 是一个宏, 它能让你将一个包的 require 和它的相关的初始化等配置组织 在一起, 避免对同一个包的配置代码散落在不同的文件中
;;(use-package package-name
;;  :init
;;  (setq my-var1 "xxx")
;;  :config
;;  (progn
;;    (setq my-var2 "xxx")
;;    (setq my-var3 "xxx")
;;    )
;;  )

;; 在上例中, init 后的代码在包的 require 之前执行, 如果这段代码出错则跳过包的 require.
;; config 后的代码在包的 require 之后执行.
;; init 与 config 之后只能接单个表达式语句, 如果需要执行多个语句, 可以用 progn .

(use-package restart-emacs
  :ensure t)


;; 自动安装
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 保存光标历史，记住上个命令
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; 显示文件行、列、大小 ，美化状态栏
(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(add-to-list 'global-mode-string '("" keycast-mode-line-mode))
(keycast-mode-line-mode t)

;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后‘
(use-package doom-modeline
  :ensure t

  :init
  (doom-modeline-mode t))



(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode)

  ;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
)

(use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))



(provide 'init-packages)
