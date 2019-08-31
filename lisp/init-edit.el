(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-minibuffer)
  (setq which-key-idle-delay 0.4)
  (which-key-setup-side-window-right)
  )

(use-package nyan-mode
  :config
  (progn
    (nyan-mode 1)
    (setq mode-line-format
          (list
           '(:eval (list (nyan-create)))
           ))
    )
  )

(use-package nav-flash
  :config
  (nav-flash-show)
  )

(use-package smartparens
  :init
  (require 'smartparens-config)
  :config
  (progn
    (smartparens-global-mode t)

    ;;; cc-mode关掉smartparens-mode,使用autopair
    (add-hook 'c-mode-common-hook
              #'(lambda () 
		  (smartparens-mode -1))
	      )
    )
  )

(use-package autopair
  :config
  (progn
    (add-hook 'c-mode-common-hook 
              #'(lambda () (autopair-mode)))
    
    (add-hook 'c++-mode-hook
              #'(lambda ()
		  (push ?{
			(getf autopair-dont-pair :comment))))
    
    (add-hook 'c++-mode-hook
              #'(lambda ()
		  (push '(?< . ?>)
			(getf autopair-extra-pairs :code))))
    )
  )

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package hungry-delete
  :config
  (global-hungry-delete-mode)
  )

(use-package window-numbering
  :config
  (window-numbering-mode 1)
  )

(use-package volatile-highlights
  :config
  (volatile-highlights-mode t))

(use-package comment-dwim-2
  :bind (("M-;" . comment-dwim-2))
  )

(use-package iedit
  :bind (("C-;" . iedit-mode))
  :config
  (progn
    (setq iedit-toggle-key-default nil))
  )

(use-package move-dup
  :config
  (progn
    (global-set-key [M-up] 'md/move-lines-up)
    (global-set-key [M-down] 'md/move-lines-down)
    (global-set-key (kbd "C-c d") 'md/duplicate-down)
    (global-set-key (kbd "C-c u") 'md/duplicate-up)
    )
  )

(use-package youdao-dictionary
  :defer t
  :bind (("C-c y" . youdao-dictionary-search-at-point))
  :config
  )

(use-package deft
  :bind (("<f8>" . deft)
	 ("C-x C-g" . deft-find-file)
	 )
  :config
  (progn
    (setq deft-extensions '("txt" "tex" "org"))
    (setq deft-directory "~/org")
    (setq deft-recursive t)
    (setq deft-use-filename-as-title t)

    )
  )

(use-package dired-recent
  :config
  (dired-recent-mode 1)
  (define-key dired-recent-mode-map (kbd "C-x C-d") nil)
  (define-key dired-recent-mode-map (kbd "C-x M-d") #'dired-recent-open)
  )

(use-package imenu-list
  :bind ("<f3>" . imenu-list)
  :config
  (progn
    (setq imenu-list-focus-after-activation t)
    (setq imenu-list-auto-resize t)
    (setq imenu-list-after-jump-hook nil)
    (add-hook 'imenu-list-after-jump-hook #'recenter-top-bottom)
    (setq imenu-list-position "below")
    )
  )

(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

(provide 'init-edit)
