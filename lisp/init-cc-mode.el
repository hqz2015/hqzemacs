(use-package google-c-style
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  )

(use-package company-c-headers
  :config
  (progn
    (setq company-c-headers-path-system '(
                                          "/usr/include/c++/7"
                                          "/usr/include/x86_64-linux-gnu/c++/7"
                                          "/usr/include/c++/7/backward"
                                          "/usr/lib/gcc/x86_64-linux-gnu/7/include"
                                          "/usr/local/include"
                                          "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed"
                                          "/usr/include/x86_64-linux-gnu"
                                          "/usr/include"
                                          "/home/hqz/software/boost_1_64_0"
                                          "/home/hqz/pocopro/include"
                                          ))
    (add-to-list 'company-backends 'company-c-headers)
    )
  )

;;; clang-format configuration
(use-package clang-format
  :config
  (progn
    (defun clang-format-on-save ()
      (add-hook 'before-save-hook #'clang-format-buffer nil 'local))
    (add-hook 'c++-mode-hook 'clang-format-on-save)
    (add-hook 'c-mode-hook 'clang-format-on-save)
    )
  )

(use-package irony
  :config
  (progn
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    ;;(add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    )
  )


(use-package irony-eldoc
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc)
  )

(use-package company-irony
  :after(company)
  :config
  (progn
    (add-to-list 'company-backends 'company-irony)
    )
  )

(use-package company-irony-c-headers
  :after(company)
  :config
  (progn
    (add-to-list
     'company-backends '(company-irony-c-headers company-irony))
    )
  )

(use-package flycheck-irony
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package function-args
  :load-path "local/function-args"
  :config
  (progn
    (fa-config-default)
    (require 'semantic)
    (set-default 'semantic-case-fold t)
    (semantic-add-system-include "/home/hqz/software/boost_1_64_0/" 'c++-mode)
    (require 'semantic/bovine/c)
    (add-to-list 'semantic-lex-c-preprocessor-symbol-file
		 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h")
    )
  )

(use-package stickyfunc-enhance
  :init
  (progn
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1)
    )
  )

(provide 'init-cc-mode)
