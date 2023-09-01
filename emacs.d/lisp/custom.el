(global-auto-revert-mode 1) ;; 自动加载外部修改过的文件
(delete-selection-mode 1) ;; 选中一段文字后输入一个字符，将替换选中部分的文字。(其他编辑器默认特性)
(fset 'yes-or-no-p 'y-or-n-p) ;; Emacs确认某个命令时需要输入yes or no比较麻烦，可以进行简化

(setq make-backup-files nil) ;; 禁止Emacs自动备份(默认会自动产生后缀~的备份)
(setq auto-save-default nil) ;; 禁止Emacs自动保存文件
(setq ring-bell-function 'ignore) ;; 禁止Emacs中的警示音


(provide 'custom)
