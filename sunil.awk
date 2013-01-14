#Awk script to create html tables using conditions
#Author Sunil Sankar
BEGIN{
FS=",";
print "<table border=\"1\">\n<tr>\n<th bgcolor=\"#FFFF00\">Jobname</th>\n<th bgcolor=\"#FFFF00\">Date</th>\n<th bgcolor=\"#FFFF00\">Time</th>\n<th bgcolor=\"#FFFF00\">Status</th>\n";
}
{
if ( $4 == "Completed")
  print "<tr>\n<td>"$1"</td>\n<td>"$2"</td>\n<td>"$3"</td>\n<td bgcolor=\"#00FF00\">"$4"</td>\n</tr>\n";
  else if ( $4 == "Failed")
  print "<tr>\n<td>"$1"</td>\n<td>"$2"</td>\n<td>"$3"</td>\n<td bgcolor=\"#FF0000\">"$4"</td>\n</tr>\n";
  else
  print "<tr>\n<td>"$1"</td>\n<td>"$2"</td>\n<td>"$3"</td>\n<td bgcolor=\"#FF9933\">"$4"</td>\n</tr>\n";
}
END {
        print "</table>\n";
}
