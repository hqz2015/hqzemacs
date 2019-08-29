(use-package yasnippet
  :config
  (progn
    (yas-reload-all)
    (add-hook 'prog-mode-hook #'yas-minor-mode)
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
    )
  )

(use-package yasnippet-snippets
  :config
  (progn
    
    )
  )

(provide 'init-yasnippet)
