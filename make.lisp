;; make.lisp -  Creates an executable version of cybercritic.
;; Copyright (C) 2009  Rob Myers rob@robmyers.org
;;
;; This file is part of cybercritic-microblogger.
;;
;; cybercritic-microblogger is free software; you can redistribute it and/or 
;; modify it under the terms of the GNU General Public License as published 
;; by the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.
;;
;; cybercritic-microblogger is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(in-package #:cl-user)

;; Load libraries

(require 'asdf)
(load "../microblog-bot" asdf:*central-registry*)
(load "../microblog-bot/cl-twit/cl-twit.asd")
(asdf:operate 'asdf:load-op :cl-twit)
(asdf:operate 'asdf:load-op :microblog-bot)
(asdf:operate 'asdf:load-op :cybercritic)

;; Make the runnable image

(sb-ext:save-lisp-and-die "cybercritic-microblogger" 
			  :executable t 
			  :toplevel #'cybercritic:run)