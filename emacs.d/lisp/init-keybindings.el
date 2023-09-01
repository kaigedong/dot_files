;; 快捷键配置
(global-set-key (kbd "s-a") 'mark-whole-buffer) ;; 对应windows上面的Ctrl-a全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;; 对应windows上面的ctrl-c复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应windows上面的Ctrl-s保存
(global-set-key (kbd "s-v") 'yank) ;; 对应windows上面的Ctrl-v粘贴
(global-set-key (kbd "s-z") 'undo) ;; 对应windows上面的Ctrl-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;; 对应windows上面的Ctrl-x剪切

(global-set-key (kbd "<f2>") 'open-init-file) ;;F2: 快速打开配置文件
(global-set-key (kbd "<f3>") 'load-init-file) ;;F3: 加载配置文件

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun load-init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(provide 'init-keybindings)
