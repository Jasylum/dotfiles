
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar (tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(tool-bar-mode -1)
(set-fringe-mode 0)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar
(smooth-scrolling-mode 1)

(setq backup-inhibited t)

(setq redisplay-dont-pause t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
       backup-by-copying 1
       delete-old-versions -1
       version-control t
       vc-make-backup-files t)
 (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(electric-indent-mode 1)
(electric-pair-mode 1)

(auto-fill-mode 1) 

(add-hook 'dired-mode-hook 'auto-revert-mode)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x h") 'switch-to-prev-buffer)
(global-set-key (kbd "C-x l") 'switch-to-next-buffer)
;; Set up the visible bell

(load-theme 'gruber-darker t)
(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 160)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
	 ("C-x C-b" . counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

    (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

	(use-package evil-collection
	:after evil
	:config
	(evil-collection-init))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 0)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))


(defun efs/org-font-setup ())
  ;; Replace list hyphen with dot

(use-package org
  :config
  (setq org-ellipsis " ⬎")
  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vdiff-magit zones zenburn-theme yaml which-key visual-fill-column use-package sudo-edit smooth-scrolling rainbow-mode org-bullets nlinum-relative markdown-mode magit lv linum-relative gruber-darker-theme ghub general evil-collection doom-themes doom-modeline counsel corfu company closql atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
