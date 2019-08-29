(setq tab-always-indent 'complete) ;; use 't when company is disabled

(use-package company-quickhelp
      :config
      (add-hook 'after-init-hook 'company-quickhelp-mode)
      )

(use-package company
  :bind (("C-c i" . company-ispell))
  :config
  (progn
    (global-company-mode 1)
    (add-to-list 'completion-styles 'initials t)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (setq company-idle-delay 0.1
          company-minimum-prefix-length 2
          company-require-match nil
          company-dabbrev-ignore-case nil
          company-show-numbers t
          company-transformers '(company-sort-by-backend-importance)
          company-continue-commands '(not helm-dabbrev)
          company-dabbrev-downcase nil)

    )
  )


(provide 'init-company)
