#!/usr/bin/zsh

for PAGE in {1..25};do
	gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
		-dFirstPage=$PAGE -dLastPage=$PAGE \
		-sOutputFile=p_$PAGE.pdf all.pdf
done

gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
	-sOutputFile=crit_2.pdf \
	p_{5..7}.pdf

gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
	-sOutputFile=crit_3.pdf \
	p_{8..9}.pdf

gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
	-sOutputFile=crit_4.pdf \
	p_{11..16}.pdf
