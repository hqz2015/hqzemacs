(use-package ggtags
  :config
  (progn
    (add-hook 'c-mode-common-hook
              (lambda ()
                (when (derived-mode-p 'c-mode 'c++-mode)
                  (ggtags-mode 1))))

    (setenv "GTAGSLIBPATH" (concat "/usr/include"
				   ":"
				   "/usr/src/linux/include"
				   ":"
				   (file-truename "~/projects/hqz_file_transfer")
				   ))
    (setenv "MAKEOBJDIRPREFIX" (file-truename "~/objs/"))
    (setq company-backends '((company-dabbrev-code company-gtags)))

    )
  )

(provide 'init-ggtags)
