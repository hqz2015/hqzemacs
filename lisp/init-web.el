(use-package js2-mode
  :config
  (progn

    )
  )

(use-package nodejs-repl
  :config
  (progn

    )
  )

(use-package web-mode
  :config
  (progn
    (defun my-web-mode-indent-setup ()
      (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
      (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
      (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
      )

    (add-hook 'web-mode-hook 'my-web-mode-indent-setup)
    )
  )

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))


(provide 'init-web)
