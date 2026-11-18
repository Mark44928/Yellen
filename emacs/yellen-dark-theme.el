;;; yellen-dark-theme.el --- Yellen warm golden Emacs theme -*- lexical-binding: t -*-
;;; Recipe: warm neutrals with golden accents throughout.

(deftheme yellen-dark
  "Yellen: a warm golden theme family — {{variant}} variant.
Warm neutrals and golden accents throughout."
  :family 'yellen
  :kind 'color-scheme
  :background-mode '{{variant}})

(custom-theme-set-faces
 'yellen-dark
  ;; UI
 '(default ((t (:foreground "#F3E8B8" :background "#171408"))))
 '(cursor ((t (:background "#F2D14E" :foreground "#171408"))))
 '(region ((t (:background "#F2D14E" :foreground "#171408"))))
 '(hl-line ((t (:background "#24200C"))))
 '(fringe ((t (:background "#171408"))))
 '(mode-line ((t (:foreground "#F3E8B8" :background "#24200C" :bold t))))
 '(mode-line-inactive ((t (:foreground "#87763B" :background "#171408"))))
 '(mode-line-buffer-id ((t (:bold t :foreground "#F2D14E" :background "#24200C"))))
 '(mode-line-highlight ((t (:foreground "#F7DE72" :background "#24200C" :weight bold))))
 '(minibuffer-prompt ((t (:bold t :foreground "#C98B6B"))))

 ;; Syntax — mirrors colors/yellen.vim
 '(font-lock-comment-face ((t (:foreground "#87763B" :slant italic))))
 '(font-lock-keyword-face ((t (:foreground "#C98B6B" :weight bold))))
 '(font-lock-function-name-face ((t (:foreground "#D8A93B" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#F2D14E"))))
 '(font-lock-variable-name-face ((t (:foreground "#F3E8B8"))))
 '(font-lock-type-face ((t (:foreground "#E6C15A"))))
 '(font-lock-constant-face ((t (:foreground "#C98B6B"))))
 '(font-lock-builtin-face ((t (:foreground "#F3E8B8"))))
 '(font-lock-preprocessor-face ((t (:foreground "#C98B6B"))))
 '(font-lock-warning-face ((t (:foreground "#C76A52"))))
 '(font-lock-number-face ((t (:foreground "#E6C15A"))))
 '(font-lock-operator-face ((t (:foreground "#F7DE72"))))

 ;; Diff / org / misc
 '(diff-added ((t (:foreground "#F2D14E" :background "#24200C"))))
 '(diff-removed ((t (:foreground "#C76A52" :background "#24200C"))))
 '(diff-changed ((t (:foreground "#F7DE72" :background "#24200C"))))
 '(org-code ((t (:foreground "#F2D14E"))))
 '(org-link ((t (:foreground "#E6C15A" :underline t))))
 '(org-todo ((t (:weight bold :foreground "#C98B6B"))))

 ;; Highlights
 '(highlight ((t (:foreground "#F3E8B8" :background "#F7DE72"))))
 '(link ((t (:foreground "#E6C15A" :underline t))))
 '(error ((t (:foreground "#C76A52" :weight bold))))
 '(warning ((t (:foreground "#F7DE72"))))

 ;; Completion / UI extras
 '(company-preview ((t (:background "#24200C" :foreground "#F3E8B8"))))
 '(company-tooltip ((t (:foreground "#F3E8B8" :background "#24200C" :bold t))))
 '(magit-section-heading ((t (:foreground "#F2D14E" :weight bold))))
 '(magit-item-highlight ((t (:background "#24200C")))))

(provide-theme 'yellen-dark)
;;; yellen-dark-theme.el ends here
