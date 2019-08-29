(defun hqz/rtags-setup()
    ;;; RTags configuration
  (use-package rtags
    :config
    (progn
      (rtags-enable-standard-keybindings)
      (setq rtags-autostart-diagnostics t)
      (rtags-diagnostics)
      )
    )

  (use-package company-rtags
    :after (rtags)
    :config
    (progn
      (defun company-rtags-setup ()
        "Configure company-backends for company-rtags."
        (delete 'company-semantic company-backends)
        (setq rtags-completions-enabled t)
        (push '(company-rtags :with company-yasnippet) company-backends))
      )
    )

  (use-package flycheck-rtags
    :after (rtags)
    :config
    (progn
      (defun flycheck-rtags-setup ()
        "Configure flycheck-rtags."
        (flycheck-select-checker 'rtags)
        (setq-local flycheck-highlighting-mode nil)
        (setq-local flycheck-check-syntax-automatically nil))
      )
    )
  )

(add-hook 'after-init-hook 'hqz/rtags-setup)


(provide 'init-rtags)
