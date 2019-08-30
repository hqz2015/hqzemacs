;; 关闭工具栏
(tool-bar-mode -1) 

;; 关闭滚动条
(scroll-bar-mode -1) 

;; 关闭菜单栏
(menu-bar-mode -1) 

(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行号
(global-linum-mode 1)

;; 高亮当前行
(global-hl-line-mode t)
(set-face-background 'hl-line "#3e4446")

(delete-selection-mode 1)

;;关闭响铃
(setq ring-bell-function 'ignore)

;; 关闭备份文件 在init-edit中已设
(setq make-backup-files nil)
(setq auto-save-default nil)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(add-hook 'after-init-hook 'show-paren-mode)

;; emacs平滑滚动
(setq mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;设置光标
(setq-default cursor-type 'bar)

(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(setq inhibit-splash-screen 1)
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(display-time-mode 1)

(use-package recentf
  :ensure nil 
  :config
  (progn
    (setq-default recentf-max-saved-items 20) 
    (recentf-mode 1)
    )   
  )


(provide 'init-general)
