(use-package py-autopep8
  :after (elpy)
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  )

(use-package elpy
  :after (company-jedi)
  :config
  (progn
    (elpy-enable)
    (setq elpy-rpc-backend "jedi")
    ;; Fixing a key binding bug in elpy
    (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
    ;; Fixing another key binding bug in iedit mode
    (define-key global-map (kbd "C-c o") 'iedit-mode)
    (when (require 'flycheck nil t)
      (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
      (add-hook 'elpy-mode-hook 'flycheck-mode))
    ))

(use-package company-jedi
  :config
  (progn
    (defun company-jedi-setup ()
      "Configure company-backends for company-jedi and company-yasnippet."
      (push '(company-jedi :with company-yasnippet) company-backends)
      ;; (add-to-list 'company-backends 'company-jedi)
      )
    (add-hook 'python-mode-hook 'company-jedi-setup)

    (setq jedi:setup-keys t)
    (setq jedi:complete-on-dot t)
    (add-hook 'python-mode-hook 'jedi:setup)
    )
  )

(provide 'init-python)
