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
  :config
  (progn
    (require 'smartparens-config)
    (add-hook 'elisp-mode-hook 'smartparens-mode)
    ;; (add-hook 'c++-mode-hook #'smartparens-mode)
    ;; (smartparens-global-mode t)
    )
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

(use-package awesome-pair
  :load-path "local/awesome-pair"
  :config
  (progn
    (dolist (hook (list
		   'c-mode-common-hook
		   'c-mode-hook
		   'c++-mode-hook
		   'java-mode-hook
		   'haskell-mode-hook
		   'emacs-lisp-mode-hook
		   'lisp-interaction-mode-hook
		   'lisp-mode-hook
		   'maxima-mode-hook
		   'ielm-mode-hook
		   'sh-mode-hook
		   'makefile-gmake-mode-hook
		   'php-mode-hook
		   'python-mode-hook
		   'js-mode-hook
		   'go-mode-hook
		   'qml-mode-hook
		   'jade-mode-hook
		   'css-mode-hook
		   'ruby-mode-hook
		   'coffee-mode-hook
		   'rust-mode-hook
		   'qmake-mode-hook
		   'lua-mode-hook
		   'swift-mode-hook
		   'minibuffer-inactive-mode-hook
		   ))
      (add-hook hook '(lambda () (awesome-pair-mode 1))))
    )
  )

(define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
(define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
(define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
(define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
(define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
(define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
(define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)

(define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
(define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

(define-key awesome-pair-mode-map (kbd "SPC") 'awesome-pair-space)

(define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
(define-key awesome-pair-mode-map (kbd "C-d") 'awesome-pair-forward-delete)
(define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

(define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
(define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
(define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
(define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
(define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

(define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-right)
(define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-left)
(define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)


(provide 'init-edit)
