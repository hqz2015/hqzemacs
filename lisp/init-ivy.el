(use-package swiper
  :bind (("C-s" . swiper)
	 ("C-x C-f" . counsel-find-file)
	 ("M-x" . counsel-M-x)
	 ("<f6>" . ivy-resume))
  :config
  (progn
    (ivy-mode 1)
    (setq enable-recursive-minibuffers t)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    )
  )

(provide 'init-ivy)
