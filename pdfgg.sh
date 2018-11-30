# Format in std input:
# <namepdf>.pdf cat <page> <page> <page> <page> <...> <page>
# example: 
# Lecture1.pdf cat 10 12 13 40 

id=0
merge=""
while read i; do
	id=`expr $id + 1`
	echo " $id => processing $i"
	pdftk $i output tmp$id.pdf
	merge=$(echo "$merge tmp$id.pdf")
done

pdftk $merge output out.pdf
pdfnup --nup 2x4 --suffix 'nup' --no-landscape --frame true --batch out.pdf
rm tmp*
