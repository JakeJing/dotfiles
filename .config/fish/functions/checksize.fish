function gb --description "grep bib file by removing unnecessary ids"
    grep -v "url =\|issn =\|isbn =\|=language =\|urldate =\|date-added =\|month =" $argv[1] >$argv[2]
end
