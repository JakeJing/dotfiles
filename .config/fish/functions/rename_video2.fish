function rename_video2 --description "rename videos by removing first 5 chars"
    for file in *.mp4
        # Extract the new filename by removing the first 5 characters or -start from the 6th char
        set newname (echo $file | string sub -s 6)

        # Replace '?' with '-'
        set newname (echo $newname | string replace '?' '-')

        # Rename the file
        mv $file $newname
    end
end
