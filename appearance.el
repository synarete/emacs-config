;;; appearance.el -- Update appearance and theme -*- lexical-binding: t; -*-

(my-user-config "appearance-common.el")

(my-user-config "appearance-prog.el")

(my-user-config "appearance-doom.el"
                :needs '(doom-themes doom-modeline))

(my-user-config "appearance-graphic.el"
                :needs '(doom-themes doom-modeline)
                :when 'display-graphic-p)
