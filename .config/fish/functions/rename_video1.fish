function rename_video1 --description 'rename videos by removing the first 4 chars and replacing ? with -'
    for file in *.mp4 *.srt
        # Extract the new filename by removing the first 4 characters
        set newname (echo $file | string sub -s 5)

        # Replace '?' with '-'
        set newname (echo $newname | string replace '?' '-')

        # Rename the file
        mv $file $newname
    end
end

# function rename_video1 --description "rename videos by removing the first 4 chars"
#     for file in *.mp4
#         # Extract the new filename by removing the first 4 characters or -start from 5th char
#         set newname (echo $file | string sub -s 5)

#         # Rename the file
#         mv $file $newname
#     end
# end
