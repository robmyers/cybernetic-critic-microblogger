;; make.lisp -  Creates an executable version of cybercritic.
;; Copyright (C) 2009  Rob Myers rob@robmyers.org
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(in-package #:cl-user)

;; Load libraries despite asdf0
(require 'asdf)
(load "../microblog-bot/cl-twit/cl-twit.asd")
(load "../microblog-bot/microblog-bot.asd")
(asdf:operate 'asdf:load-op :cl-twit)
(asdf:operate 'asdf:load-op :microblog-bot)
(asdf:operate 'asdf:load-op :cybercritic)

;; Make the runnable image

(sb-ext:save-lisp-and-die "cybercritic-microblogger" 
			  :executable t 
			  :toplevel #'cybercritic:run)
