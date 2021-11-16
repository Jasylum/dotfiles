;;; zones-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "zones" "zones.el" (0 0 0 0))
;;; Generated autoloads from zones.el

(defalias 'zz-select-region-by-id-and-text #'zz-select-zone-by-id-and-text)

(autoload 'zz-select-zone-by-id-and-text "zones" "\
Select a zone by completing against its ID and its text (content).
The text of the chosen zone is made the active region.

The zones to choose from are those of VARIABLE that are in the current
buffer.  VARIABLE defaults to the value of `zz-izones-var'.  With a
prefix arg you are prompted for a different variable to use.

If option `zz-auto-remove-empty-izones-flag' is non-nil then all empty
zones are first removed from VARIABLE.

Non-interactively:
* VARIABLE is the optional izones variable to use.
* Non-nil MSGP means show a status message.

\(fn ID &optional VARIABLE MSGP)" t nil)

(defalias 'zz-select-region #'zz-select-zone)

(autoload 'zz-select-zone "zones" "\
Select a zone in `zz-izones-var', and make it the active region.
With no prefix arg, select the first zone of the list.
With a numeric prefix arg N, select the Nth zone of the list.
\(N is one-based, not zero-based.)
The newly selected zone is then moved to the end of the list.

With a negative prefix arg N remove that zone from the list and
renumber the zones.  This is a destructive operation: The list
structure of the variable value can be modified.

Note that if the value of `zz-izones-var' is not buffer-local then you
can use this command to cycle among (or to remove) zones in multiple
buffers.

If option `zz-auto-remove-empty-izones-flag' is non-nil then all empty
zones are first removed from `zz-izones-var'.

\(fn ARG &optional MSGP)" t nil)

(autoload 'zz-narrow "zones" "\
Widen to a previous buffer restriction (narrowing).
The candidates are the zones in the current `zz-izones-var'.

With no prefix arg, widen to the previous narrowing.
With a plain prefix arg (`C-u'), widen completely.
With a zero  prefix arg (`C-0'), widen completely and reset (empty)
 the list of zones for this buffer.
With a numeric prefix arg N, widen abs(N) times (to the abs(N)th
 previous narrowing).  Positive and negative args work the same,
 except that a negative arg also pops entries off the ring: it removes
 the ring entries from the most recent back through the (-)Nth one.

If option `zz-auto-remove-empty-izones-flag' is non-nil then all empty
zones are first removed from `zz-izones-var'.

\(fn ARG &optional MSGP)" t nil)

(autoload 'zz-add-zone "zones" "\
Add an izone for the region to the izones of VARIABLE.
But do not add a zone if it would cover the entire buffer.
Return the new value of VARIABLE.

This is a destructive operation: The list structure of the variable
value can be modified.

VARIABLE defaults to the value of `zz-izones-var'.

With a prefix arg you are prompted for a different variable to use, in
place of the current value of `zz-izones-var'.  The particular prefix
arg determines whether the variable, if unbound, is made buffer-local,
and whether `zz-izones-var' is set to the variable symbol:

  prefix arg          buffer-local   set `zz-izones-var'
  ----------          ------------   -------------------
  Plain `C-u'         yes            yes
  > 0 (e.g. `C-1')    yes            no
  = 0 (e.g. `C-0')    no             yes
  < 0 (e.g. `C--')    no             no

Non-interactively:
* START and END are as for `narrow-to-region'.
* VARIABLE is the optional izones variable to use.
* Non-nil NOT-BUF-LOCAL-P means do not make VARIABLE buffer-local.
* Non-nil SET-VAR-P means set `zz-izones-var' to VARIABLE.
* Non-nil MSG means echo the zone limits, preceded by string MSG.

See also `zz-add-region-as-izone' which also adds the region as an
izone, but which has a simpler signature and so can be used as a hook
function.  (In particular, it is used `on `deactivate-mark-hook' by
`zz-auto-add-region-as-izone-mode', to automatically add the region as
an izone each time it is deactivated.)

\(fn START END &optional VARIABLE NOT-BUF-LOCAL-P SET-VAR-P MSG)" t nil)

(autoload 'zz-delete-zone "zones" "\
Delete a zone by completing against its ID and its text (content).
Delete the zone from VARIABLE, and renumber those remaining.
Return the new value of VARIABLE.

This is a destructive operation: The list structure of the variable
value can be modified and the zones are renumbered.

VARIABLE defaults to the value of `zz-izones-var'.  With a prefix arg
you are prompted for a different variable to use.

Non-nil optional arg NOMSG means do not display a status message.

If option `zz-auto-remove-empty-izones-flag' is non-nil then all empty
zones are first removed from VARIABLE.

\(fn ID &optional VARIABLE MSGP)" t nil)

(autoload 'zz-narrow-repeat "zones" "\
Cycle to the next buffer restriction (narrowing).
This is a repeatable version of `zz-narrow'.

Note that if the value of `zz-izones-var' is not buffer-local then you
can use this command to cycle among zones in multiple buffers." t nil)

(defalias 'zz-select-region-repeat #'zz-select-zone-repeat)

(autoload 'zz-select-zone-repeat "zones" "\
Cycle to the next zone, and make it the active region.
Zones are cycled in chronological order of their recording.
This is a repeatable version of `zz-select-zone'." t nil)

(autoload 'zz-set-izones-var "zones" "\
Set `zz-izones-var' to VARIABLE, for which you are prompted.
With a prefix arg, make VARIABLE automatically be buffer-local.

\(fn VARIABLE &optional LOCALP)" t nil)

(autoload 'zz-clone-zones "zones" "\
Clone FROM-VARIABLE to TO-VARIABLE.
Return the new value of TO-VARIABLE.
That is, copy the zones of FROM-VARIABLE to (emptied) TO-VARIABLE.
A non-destructive operation: The value of TO-VARIABLE is a new list,
 with only the zones from FROM-VARIABLE.
Return the value of TO-VARIABLE.

You are prompted for FROM-VARIABLE and TO-VARIABLE.

With a non-negative (>= 0) prefix arg, make TO-VARIABLE buffer-local.
With a non-positive (<= 0) prefix arg, set `zz-izones-var' to the
TO-VARIABLE symbol.  (Zero: do both.)

FROM-VARIABLE defaults to the value of `zz-izones-var'.

Non-interactively: Non-nil MSGP means show a status message.

\(fn FROM-VARIABLE TO-VARIABLE &optional MSGP)" t nil)

(defalias 'zz-clone-and-coalesce-zones #'zz-clone-and-unite-zones)

(autoload 'zz-clone-and-unite-zones "zones" "\
Clone FROM-VARIABLE to TO-VARIABLE, then unite (coalesce) TO-VARIABLE.
That is, use`zz-clone-zones' to fill TO-VARIABLE, then use
`zz-unite-zones' on TO-VARIABLE.

Just as for `zz-clone-zones':
 With a non-negative (>= 0) prefix arg, make TO-VARIABLE buffer-local.
 With a non-positive (<= 0) prefix arg, set `zz-izones-var' to the
 TO-VARIABLE symbol.  (Zero: do both.)

United zones are in ascending order of their cars.
Return the new value of TO-VARIABLE.

Use this when you do not want to unite the zones of FROM-VARIABLE (for
example, you want to use them as possibly overlapping buffer
narrowings), but you also want to act on the united zones (for
example, to search them).

FROM-VARIABLE defaults to the value of `zz-izones-var'.

Non-interactively: Non-nil MSGP means show a status message.

\(fn FROM-VARIABLE TO-VARIABLE &optional MSGP)" t nil)

(defalias 'zz-coalesce-zones #'zz-unite-zones)

(autoload 'zz-unite-zones "zones" "\
Coalesce (unite) the izones of VARIABLE.
A non-destructive operation: The new value of VARIABLE is a new list.
Return the new value of VARIABLE.

United zones are in ascending order of their cars.

VARIABLE defaults to the value of `zz-izones-var'.
With a prefix arg you are prompted for a different variable to use, in
place of the current value of `zz-izones-var'.  If the prefix arg is
non-negative (>= 0) then make the variable buffer-local.  If the
prefix arg is non-positive (<= 0) then set `zz-izones-var' to that
variable symbol.  (Zero: do both.)

Non-interactively:
* VARIABLE is the optional izones variable to use.
* Non-nil MSGP means show a status message.

\(fn &optional VARIABLE MSGP)" t nil)

(defalias 'zz-add-zone-and-coalesce #'zz-add-zone-and-unite)

(autoload 'zz-add-zone-and-unite "zones" "\
Add an izone from START to END to those of VARIABLE, and coalesce.
Use `zz-add-zone', then apply `zz-unite-zones'.
United zones are in ascending order of their cars.
Return the new value of VARIABLE.

This is a destructive operation: The list structure of the variable
value can be modified.

VARIABLE defaults to the value of `zz-izones-var'.
START and END are as for `narrow-to-region'.

With a prefix arg you are prompted for a different variable to use, in
place of the current value of `zz-izones-var'.  If the prefix arg is
non-negative (>= 0) then make the variable buffer-local.  If the
prefix arg is non-positive (<= 0) then set `zz-izones-var' to that
variable symbol.  (Zero: do both.)

Non-interactively:
* VARIABLE is the optional izones variable to use.
* Non-nil MSG means echo messages for adding the zone and uniting
  zones.  In this case MSG is the message prefix for `zz-add-zone'.

\(fn START END &optional VARIABLE MSG)" t nil)

(autoload 'zz-add-zones-matching-regexp "zones" "\
Add matches for REGEXP as zones to the izones of VARIABLE.
If region is active, limit action to region.  Else, use whole buffer.
Return the new value of VARIABLE.

If `isearchp-dim-outside-search-area-flag' is non-nil then dim the
non-contexts.  (You can use `\\[isearchp-remove-dimming]' or `\\[isearchp-toggle-dimming-outside-search-area]' to remove the
dimming.)

Optional arg SUBEXP is the number of the regexp subgroup to match for
the zone.  By default, the whole regexp match is used (value 0).

See `zz-add-zone' for a description of VARIABLE, the use of a prefix
arg, and the parameters when called from Lisp.

\(fn REGEXP &optional VARIABLE BEG END NOT-BUF-LOCAL-P SET-VAR-P SUBEXP MSGP)" t nil)

(autoload 'zz-set-zones-matching-regexp "zones" "\
Replace value of izones variable with zones matching REGEXP.
Like `zz-add-zones-matching-regexp' (which see), but it replaces any
current zones instead of adding to them.

\(fn REGEXP &optional VARIABLE BEG END NOT-BUF-LOCAL-P SET-VAR-P SUBEXP MSGP)" t nil)

(autoload 'zz-add-zones-from-highlighting "zones" "\
Add highlighted areas as zones to izones variable.
By default, the text used is that highlighted with `hlt-last-face'.
With a non-negative prefix arg you are instead prompted for the face.

With a non-positive prefix arg use face property `font-lock-face'
instead of property `face'.

The izones variable to use is the value of `zz-izones-var'.  You can
set this to a different variable anytime using `\\[zz-set-izones-var]'.

All highlighting is checked, both overlays and face text properties.

The number of highlighted areas added as zones is echoed in a message.
This might be less than the number of zones added, because there can
be multiple highlights with the same face for the same area.

When called from Lisp:

* Non-nil START and END are the buffer limits to search.
* Non-nil FACE is the highlighting face to look for.
* Non-nil ONLY-HLT-FACE means check only `highlight.el' highlighting.
  (By default, any highlighting is checked.)
* If OVERLAY/TEXT is `text-prop' then only text-property highlighting
  is checked. If it is `overlay' then only overlay highlighting is
  checked.  (If nil then both are checked.)
* Non-nil FONK-LOCK-P means check property `font-lock-face'.  By
  default (nil), check property `face'.

\(fn &optional START END FACE ONLY-HLT-FACE OVERLAY/TEXT FONK-LOCK-P MSGP)" t nil)

(autoload 'zz-set-zones-from-highlighting "zones" "\
Replace value of izones variable with zones from the highlighted areas.
Like `zz-add-zones-from-highlighting' (which see), but it replaces any
current zones instead of adding to them.

\(fn &optional START END FACE ONLY-HLT-FACE OVERLAY/TEXT FONK-LOCK-P MSGP)" t nil)

(autoload 'zz-set-zones-from-face "zones" "\
Set an izones variable to (united) zones of a face or background color.
You are prompted for a face name or a color name.  If you enter a
color, it is used for the face background.  The face foreground is
determined by the value of `hlt-auto-face-foreground'.
The variable defaults to `zz-izones'.  With a prefix arg you are
  prompted for a different izones variable.

\(fn FACE &optional START END VARIABLE)" t nil)

(autoload 'zz-auto-add-region-as-izone-mode "zones" "\
Toggle automatically adding region as an izone upon its deactivation.
The zone is added to the current value of `zz-izones-var'.  An empty
region is not added.

If called interactively, enable Zz-Auto-Add-Region-As-Izone mode
if ARG is positive, and disable it if ARG is zero or negative.
If called from Lisp, also enable the mode if ARG is omitted or
nil, and toggle it if ARG is `toggle'; disable the mode
otherwise.

This uses function `zz-add-region-as-izone' on `deactivate-mark-hook'.

\(fn &optional ARG)" t nil)

(autoload 'zz-add-region-as-izone "zones" "\
Add non-empty region as izone to current value of `zz-izones-var'.

\(fn &optional INTERACTIVEP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "zones" '("zz-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; zones-autoloads.el ends here
