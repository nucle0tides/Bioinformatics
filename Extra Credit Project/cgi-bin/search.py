#!/usr/bin/python

# Import modules for CGI handling
import cgi, cgitb
from Bio.Blast import NCBIWWW, NCBIXML
# Create instance of FieldStorage
form = cgi.FieldStorage()

if form.getvalue('textcontent'):
   sequence = form.getvalue('textcontent')
else:
   sequence = ""

if len(sequence) != 0:
        result_handle = NCBIWWW.qblast("blastn", "nt", str(sequence))
        record = NCBIXML.read(result_handle)
        pred_seq = record.alignments[0].title
        pred_seq_length = record.alignments[0].length
        more = str(record.alignments[0].hsps[0])

print "Content-type:text/html\r\n\r\n"
print "<html>"
print "<head>"
print "<title>BLAST RESULTS</title>"
print "</head>"
print "<body>"
print "<p><strong>BLAST result:</strong> %s</p>" % pred_seq
print "<p><strong>Length:</strong> %s</p>" % pred_seq_length
print "<p><strong>More info:</strong> %s </p>" % more
print "</body>"
print "</html>"
