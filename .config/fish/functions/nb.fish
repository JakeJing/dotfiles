function nb --description 'numbering all pictures in a folder'
    # usage: >> nb png
    set i 1
    for file in *.$argv
        set num (printf "%03d" $i)
        mv "$file" "$num.$argv"
        set i (math "$i + 1")
    end
end
