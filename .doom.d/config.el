;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Doopath config setup

;; clients, file templates and snippets.
(setq user-full-name "Michael Doopath"
      user-mail-address "maminpahat@gamil.com")

;; Background transparency
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; Set autocompletion delay
(setq company-idle-delay 0.1
      company-minimum-prefix-length 2)

(setq doom-font (font-spec :family "Hasklug Nerd Font" :size 14 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "Hack" :size 14 :weight 'bold))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Evil-easymotion settings
(evilem-default-keybindings "SPC")
(evilem-define (kbd "SPC w") 'evil-forward-word-begin)


;; Here are some additional functions/macros that could help you configure Doom:
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
