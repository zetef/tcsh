#
# $Id: complete.tcsh,v 1.4 1992/03/27 01:59:46 christos Exp $
# example file using the new completion code
#

if ($?tcsh) then
    if ($tcsh != 1) then
   	set rev=$tcsh:r
	set rel=$rev:e
	set pat=$tcsh:e
	set rev=$rev:r
    endif
    if ($rev > 5 && $rel > 0 && $pat > 1) then
	set complete=1
    endif
    unset rev rel pat
endif

if ($?complete) then
    set noglob
    set hosts=(hyperion phaeton guillemin theory.tc vangogh.cs.berkeley.edu)
    set ftphosts=(ftp.uu.net prep.ai.mit.edu export.lcs.mit.edu \
		  labrea.stanford.edu sumex-aim.stanford.edu \
		  tut.cis.ohio-state.edu)

    complete rsh	n/*/$hosts/	# argument from list in $hosts
    complete ywho  	n/*/$hosts/
    complete ftp 	n/*/$ftphosts/
    complete cd  	p/1/d/		# Directories only
    complete chdir 	p/1/d/
    complete pushd 	p/1/d/
    complete popd 	p/1/d/
    complete pu 	p/1/d/
    complete po 	p/1/d/
    complete mkdir 	p/1/d/
    complete rmdir 	p/1/d/
    complete man 	p/1/c/		# only commands
    complete complete 	p/1/c/
    complete uncomplete p/1/c/
    complete exec 	p/1/c/
    complete trace 	p/1/c/
    complete strace 	p/1/c/
    complete which 	p/1/c/
    complete where 	p/1/c/
    complete skill 	p/1/c/
    complete dde	p/1/c/ 
    complete adb	p/1/c/ 
    complete sdb	p/1/c/
    complete dbx	p/1/c/
    complete xdb	p/1/c/
    complete gdb	p/1/c/
    complete ups	p/1/c/
    complete set	p/1/s/=		# only shell variables
    complete unset	p/1/s/
    complete setenv 	p/1/e/		# only environment variables 
    complete unsetenv 	p/1/e/
    complete alias 	p/1/a/		# only aliases are valid
    complete unalias 	p/1/a/
    complete xdvi 	n/*/f:*.dvi/	# Only files that match *.dvi
    complete dvips 	n/*/f:*.dvi/
    complete latex 	n/*/f:*.tex/
    complete tex 	n/*/f:*.tex/
    complete rlogin 	c/-/"(l 8 e)"/ n/-l/u/ n/*/$hosts/ 
    complete xrsh   	c/-/"(l 8 e)"/ n/-l/u/ n/*/$hosts/ 
    complete cc 	c/-I/d/ c/-L/d/ c/-/"(o l c g L I D U)"/ \
			n/*/f:*.[coa]/
    complete acc 	c/-I/d/ c/-L/d/ c/-/"(o l c g L I D U)"/ \
			n/*/f:*.[coa]/
    complete gcc 	c/-I/d/ c/-L/d/ \
		 	c/-f/"(caller-saves cse-follow-jumps delayed-branch \
		               elide-constructors expensive-optimizations \
			       float-store force-addr force-mem inline \
			       inline-functions keep-inline-functions \
			       memoize-lookups no-default-inline \
			       no-defer-pop no-function-cse omit-frame-pointer \
			       rerun-cse-after-loop schedule-insns \
			       schedule-insns2 strength-reduce \
			       thread-jumps unroll-all-loops \
			       unroll-loops syntax-only all-virtual \
			       cond-mismatch dollars-in-identifiers \
			       enum-int-equiv no-asm no-builtin \
			       no-strict-prototype signed-bitfields \
			       signed-char this-is-variable unsigned-bitfields \
			       unsigned-char writable-strings call-saved-reg \
			       call-used-reg fixed-reg no-common \
			       no-gnu-binutils nonnull-objects \
			       pcc-struct-return pic PIC shared-data \
			       short-enums short-double volatile)"/ \
		 	c/-W/"(all aggregate-return cast-align cast-qual \
		      	       comment conversion enum-clash error format \
		      	       id-clash-len implicit missing-prototypes \
		      	       no-parentheses pointer-arith return-type shadow \
		      	       strict-prototypes switch uninitialized unused \
		      	       write-strings)"/ \
		 	c/-m/"(68000 68020 68881 bitfield fpa nobitfield rtd \
			       short c68000 c68020 soft-float g gnu unix fpu \
			       no-epilogue)"/ \
		 	c/-d/"(D M N)"/ \
		 	c/-/"(f W vspec v vpath ansi traditional \
			      traditional-cpp trigraphs pedantic x o l c g L \
			      I D U O O2 C E H B b V M MD MM i dynamic \
			      nodtdlib static nostdinc undef)"/ \
		 	c/-l/f:*.a/ \
		 	n/*/f:*.{c,C,cc,o,a}/
    complete g++ 	n/*/f:*.{C,cc,o}/
    complete CC 	n/*/f:*.{C,cc,o}/
    complete rm 	n/*/f:^*.{c,cc,C,h}/	# Protect precious files
    complete vi 	n/*/f:^*.o/
    complete emacs 	n/*/f:^*~/		# dont want to edit a backup
    complete mail 	p/1/u/			# trade files for users
    complete bindkey 	p/1/b/
    complete find 	n/-fstype/"(nfs 4.2)"/ n/-name/f/ \
		  	n/-type/"(c b d f p l s)"/ n/-user/u/ n/-exec/c/ \
		  	n/-ok/c/ n/-cpio/f/ n/-ncpio/f/ n/-newer/f/ \
		  	c/-/"(fstype name perm prune type user nouser \
		  	     group nogroup size inum atime mtime ctime exec \
			     ok print ls cpio ncpio newer xdev depth)"/ \
			n/*/d/

    complete kill	c/-/S/ c/%/j/
    complete %*		c/%/j/			# fill in the jobs builtin
    complete fg		c/%/j/
    complete bg		c/%/j/
    complete stop	c/%/j/

    complete limit	c/-/"(h)"/ n/*/l/
    complete unlimit	c/-/"(h)"/ n/*/l/

    complete -co*	p/0/"(compress)"/	# make compress completion
						# not ambiguous
    complete zcat	n/*/f:*.Z/
    complete nm		n/*/f:^*.{h,C,c,cc}/

    complete rcp c/*:/f/ p/1/$hosts/:
    complete finger c/*@/$hosts/ p/1/u/@ 
    complete talk p/1/'`users | tr " " "\012" | uniq`'/ \
		  n/*/\`who\ \|\ grep\ \$:1\ \|\ awk\ \'\{\ print\ \$2\ \}\'\`/
    

    unset noglob
    unset complete
endif
