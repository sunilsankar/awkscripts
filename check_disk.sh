#!/bin/bash
#Author Sunil Sankar
#Date 16-Jan-2013
#Purpose to send disk utilization email
TMP=/tmp/disk_util
HTML=/tmp/disk_util.html
df -H | grep -vE '^Filesystem|dev' | awk '{print $4 "," $5}' >> $TMP
df -H | grep /boot | awk '{print $5 "," $6}' >> $TMP
awk '
BEGIN{
FS=",";
print "<html>\n<body>\n<table border=\"1\"\n<tr>\n<th bgcolor=\"#FFFF00\">Partition</th>\n<th bgcolor=\"#FFFF00\">Used%</th>\n";
}
{
#This is for WARNING Range 70 to 80
 if (int($1) >=70 && int($1) <80)
        print "<tr>\n<td>"$2"</td>\n<td bgcolor=\"#FFD700\">"$1"</td>\n</tr>\n";
#This is for Critical 80%
 else if (int($1) >=80)
        print "<tr>\n<td>"$2"</td>\n<td bgcolor=\"#FF0000\">"$1"</td>\n</tr>\n";
 else
        print "<tr>\n<td>"$2"</td>\n<td bgcolor=\"66FF00\">"$1"</td>\n</tr>\n";
}
END {
        print "</table>\n</html>\n</body>\n";
}' $TMP > $HTML
