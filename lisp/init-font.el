(use-package default-text-scale
  :config
  (add-hook 'after-init-hook 'default-text-scale-mode)
  )

(when *is-a-linux*
  (set-frame-font "-unkonwn-Ubuntu Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "Noto Sans CJK JP" :size 16))))

(provide 'init-font)
