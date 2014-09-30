#!/bin/sed -nf
/^## \+@fn/{
    :step
    /@param [^ ]\+ .*$/{
        s/\(@fn [^(]*\)(\(.*\))\(.*\)\(@param \)\([^ \n]\+\(\.\.\.\)\?\)\([^\n]*\)$/\1(\2, \5)\3\4\5\7/
    }
    /[a-zA-Z0-9_]\+() {$/!{
         N
	 b step
    }
    s/\(@fn[^(]\+\)(, /\1(/
    s/\(@fn \([^(]\+\)(\)\([^)]*\)\().*\)\n\2() {/\1\3\4\n\2(\3) { }/
    s/\(^\|\n\)## /\1\/\/! /g
    p
}
/^declare /{
    x
    s/.*//
    x
    s/^declare \+//
    /^[^-]/{
        x
	s/.*/&String /
	x
	b declareprint
    }
    :declare
    s/^-\([aAilrtux]\+\) \+-\([aAilrtux]\+\) \+/-\1\2 /
    t declare
    /^-[aAiltur]*x/{
        x
	s/.*/&Exported /
	x
    }
    /^-[aAiltux]*r/{
        x
	s/.*/&ReadOnly /
	x
    }   
    /^-[aAlturx]*i/{
        x
	s/.*/&Integer /
	x
    }
    /^-[aAlturx]*i/!{
        /^-[aAtrx]*l/{
            x
	    s/.*/&LowerCase /
	    x
	}
        /^-[aAtrx]*u/{
            x
	    s/.*/&UpperCase /
	    x
	}
	x
	s/.*/&String /
	x
    }
    /^-[Ailturx]*a/{
        x
	s/.*/&Array /
	x
	b deletevalue
    }
    /^-[ailturx]*A/{
        x
	s/.*/&AssociativeArray /
	x
	b deletevalue
    }
    :declareprint
    s/-[^ ]\+ \+//
    x
    G
    s/\n//
    s/=/ = /
    s/$/;/
    p
    x
}
b end

: deletevalue
s/\(-[^ ]\+ \+[^=]\+\)=.*/\1/
b declareprint

:end
s/^## /\/\/! /p
