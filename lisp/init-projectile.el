(use-package projectile
  :defer 1
  :config
  (progn
    (projectile-mode +1)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    )
  )

(use-package counsel-projectile
  :after (projectile)
  :config
  (progn
    (counsel-projectile-mode 1)
    )
  )

(provide 'init-projectile)
