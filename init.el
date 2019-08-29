(setq emacs-load-start-time (current-time))
(push (expand-file-name "~/.emacs.d/lisp") load-path)
(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")
(setq gc-cons-threshold most-positive-fixnum)

(require 'package)
(setq package-archives '(
                         ("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst *is-a-linux* (eq system-type 'gnu/linux))

(require 'init-general)
(require 'init-funcs)
(require 'init-font)
(require 'init-theme)
(require 'init-folding)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-edit)
(require 'init-ggtags)
(require 'init-rtags)
(require 'init-python)
(require 'init-cc-mode)
(require 'init-org)
(require 'init-web)
(require 'init-magit)

(require 'init-keybinding)
(when (file-exists-p custom-file)
  (load custom-file))

(setq gc-cons-threshold best-gc-cons-threshold)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

