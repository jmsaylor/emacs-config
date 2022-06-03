(require 'package)

(setq default-directory "~/Code/Clojure") 

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(wheatgrass))
 '(initial-buffer-choice "~/Code/Clojure")
 '(package-selected-packages
   '(rainbow-delimiters project-explorer cider-hydra magit clojure-mode))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "firebrick"))))
 '(rainbow-delimiters-base-face ((t (:inherit nil))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark gray"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "gainsboro"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "violet red"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "aquamarine4"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "DarkGoldenrod1"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "pale green")))))
(show-paren-mode 1)
(setq show-paren-delay 0)
(electric-pair-mode 1)

;; (require 'git)
(require 'magit)

;;(load-file "./.emacs.d/init-quil.el")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun quil-eval-defn-and-redraw ()
  "Evaluates the current defun and redraws the static quil sketch"
  (interactive)
  (cider-eval-defun-at-point)
  (cider-interactive-eval "(.redraw staticart.core/staticart) nil nil nil"))

(defun cider-start ()
  "start cider"
  (interactive)
  (cider-jack-in-clj nil))

(defun cider-full-restart ()
  "quits and jacks in cider"
  (interactive)
  (cider-quit)
  (cider-jack-in-clj nil))

(global-set-key (kbd "<f1>") 'project-explorer-open)
(global-set-key (kbd "<f8>") 'quil-eval-defn-and-redraw)
(global-set-key (kbd "<f9>") 'cider-full-restart)
(global-set-key (kbd "<f10>") 'cider-start)

(provide 'init-quil)

(global-set-key (kbd "<f4>")'display-line-numbers-mode)

;(use-package cider :ensure t)
