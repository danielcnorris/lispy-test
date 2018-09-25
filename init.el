;;; package --- summary:
;;; Commentary:
;;; Code:
(setq custom-file "~/.emacs.d/custom.el")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package clojure-mode
  :ensure t)

(use-package clj-refactor
  :ensure t
  :hook ((clojure-mode . clj-refactor-mode)))

(use-package cider
  :ensure t
  :after clj-refactor
  :init
  (setq cider-lein-parameters "repl :headless :host localhost")
  (setq cider-default-repl-command "lein"))

(use-package lispy
  :ensure t
  :after (cider)
  :hook ((emacs-lisp-mode . lispy-mode)
         (clojure-mode . lispy-mode))
  :init
  (setq lispy-compat '(edebug cider)))

(provide 'init)
;;; init.el ends here
