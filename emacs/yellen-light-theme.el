;;; yellen-light-theme.el --- Yellen warm golden Emacs theme -*- lexical-binding: t -*-
;;; Recipe: warm neutrals with golden accents throughout.

(deftheme yellen-light
  "Yellen: a warm golden theme family — {{variant}} variant.
Warm neutrals and golden accents throughout."
  :family 'yellen
  :kind 'color-scheme
  :background-mode '{{variant}})

(custom-theme-set-faces
 'yellen-light
  ;; UI
 '(default ((t (:foreground "#332A0D" :background "#FBF6DE"))))
 '(cursor ((t (:background "#82630C" :foreground "#FBF6DE"))))
 '(region ((t (:background "#82630C" :foreground "#FBF6DE"))))
 '(hl-line ((t (:background "#F1E8C4"))))
 '(fringe ((t (:background "#FBF6DE"))))
 '(mode-line ((t (:foreground "#332A0D" :background "#F1E8C4" :bold t))))
 '(mode-line-inactive ((t (:foreground "#75673C" :background "#FBF6DE"))))
 '(mode-line-buffer-id ((t (:bold t :foreground "#82630C" :background "#F1E8C4"))))
 '(mode-line-highlight ((t (:foreground "#7E620E" :background "#F1E8C4" :weight bold))))
 '(minibuffer-prompt ((t (:bold t :foreground "#98613A"))))

 ;; Syntax — mirrors colors/yellen.vim
 '(font-lock-comment-face ((t (:foreground "#75673C" :slant italic))))
 '(font-lock-keyword-face ((t (:foreground "#98613A" :weight bold))))
 '(font-lock-function-name-face ((t (:foreground "#806010" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#82630C"))))
 '(font-lock-variable-name-face ((t (:foreground "#332A0D"))))
 '(font-lock-type-face ((t (:foreground "#7A5C0A"))))
 '(font-lock-constant-face ((t (:foreground "#98613A"))))
 '(font-lock-builtin-face ((t (:foreground "#332A0D"))))
 '(font-lock-preprocessor-face ((t (:foreground "#98613A"))))
 '(font-lock-warning-face ((t (:foreground "#A4442D"))))
 '(font-lock-number-face ((t (:foreground "#7A5C0A"))))
 '(font-lock-operator-face ((t (:foreground "#7E620E"))))

 ;; Diff / org / misc
 '(diff-added ((t (:foreground "#82630C" :background "#F1E8C4"))))
 '(diff-removed ((t (:foreground "#A4442D" :background "#F1E8C4"))))
 '(diff-changed ((t (:foreground "#7E620E" :background "#F1E8C4"))))
 '(org-code ((t (:foreground "#82630C"))))
 '(org-link ((t (:foreground "#7A5C0A" :underline t))))
 '(org-todo ((t (:weight bold :foreground "#98613A"))))

 ;; Highlights
 '(highlight ((t (:foreground "#332A0D" :background "#7E620E"))))
 '(link ((t (:foreground "#7A5C0A" :underline t))))
 '(error ((t (:foreground "#A4442D" :weight bold))))
 '(warning ((t (:foreground "#7E620E"))))

 ;; Completion / UI extras
 '(company-preview ((t (:background "#F1E8C4" :foreground "#332A0D"))))
 '(company-tooltip ((t (:foreground "#332A0D" :background "#F1E8C4" :bold t))))
 '(magit-section-heading ((t (:foreground "#82630C" :weight bold))))
 '(magit-item-highlight ((t (:background "#F1E8C4")))))

(provide-theme 'yellen-light)
;;; yellen-light-theme.el ends here
