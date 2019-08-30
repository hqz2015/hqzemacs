(use-package flycheck
  :config
  (progn
    (add-hook 'after-init-hook 'global-flycheck-mode)
    (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
    (setq-default flycheck-flake8-maximum-line-length 160)
    )   
  )

(use-package flycheck-color-mode-line
  :after (flycheck)
  :config
  (progn
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
    )   
  )



(provide 'init-flycheck)
