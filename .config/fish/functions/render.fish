function ct --description 'count the number of sents and wds in a conllu file (duplicated version of cnt)'
    echo "sents: "
    cat $argv | grep -Ec '^1\t'
    echo "tokens: "
    cat $argv | grep -Ec '^[0-9]+\t'
end
