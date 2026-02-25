function unzip_rename --description 'Extract .zip files into folders named after filename prefix before first _'
    # Check if any .zip files exist
    if not count *.zip >/dev/null 2>&1
        echo "No .zip files found in current directory"
        return 1
    end

    # Check if unzip command is available
    if not command -q unzip
        echo "Error: unzip command not found. Please install unzip."
        return 1
    end

    set -l processed 0
    set -l extracted 0
    set -l skipped 0
    set -l errors 0

    for f in *.zip
        set processed (math $processed + 1)

        # Skip if file doesn't exist (broken symlink, etc.)
        if not test -f "$f"
            echo "Skipping '$f' (not a regular file)"
            set skipped (math $skipped + 1)
            continue
        end

        # Split by "_" and take the first part (before first underscore)
        set -l base (string split -m1 "_" (basename "$f" .zip))[1]

        if test -z "$base"
            echo "Skipping '$f' (no valid prefix found)"
            set skipped (math $skipped + 1)
            continue
        end

        set -l folder_name "$base"

        # Create directory if it doesn't exist
        if not test -d "$folder_name"
            if not mkdir -p "$folder_name" 2>/dev/null
                echo "Error: Failed to create directory '$folder_name' for '$f'"
                set errors (math $errors + 1)
                continue
            end
            echo "Created directory: '$folder_name'"
        end

        # Extract zip file into the folder
        echo "Extracting '$f' → '$folder_name/'"
        if unzip -q -o "$f" -d "$folder_name" 2>/dev/null
            echo "Successfully extracted '$f' to '$folder_name/'"
            set extracted (math $extracted + 1)
        else
            echo "Error: Failed to extract '$f'"
            set errors (math $errors + 1)
        end

        echo "" # Empty line for readability
    end

    # Summary
    echo "Summary:"
    echo "  Files processed: $processed"
    echo "  Successfully extracted: $extracted"
    echo "  Skipped: $skipped"
    echo "  Errors: $errors"

    # Return appropriate exit code
    if test $errors -gt 0
        return 1
    else
        return 0
    end
end

# # Defined in /Users/jakejing/.config/fish/functions/unzip_rename.fish @ line 1
# function unzip_rename --description 'Extract .zip files into folders named after first 3 digits'
#     # Check if any .zip files exist
#     if not count *.zip >/dev/null 2>&1
#         echo "No .zip files found in current directory"
#         return 1
#     end

#     # Check if unzip command is available
#     if not command -q unzip
#         echo "Error: unzip command not found. Please install unzip."
#         return 1
#     end

#     set -l processed 0
#     set -l extracted 0
#     set -l skipped 0
#     set -l errors 0

#     for f in *.zip
#         set processed (math $processed + 1)

#         # Skip if file doesn't exist (broken symlink, etc.)
#         if not test -f "$f"
#             echo "Skipping '$f' (not a regular file)"
#             set skipped (math $skipped + 1)
#             continue
#         end

#         # Extract first 3 consecutive digits from filename
#         set -l digits (string match -r -g '^[^0-9]*(\d{3})' -- "$f")

#         if test -z "$digits"
#             echo "Skipping '$f' (no 3-digit sequence found)"
#             set skipped (math $skipped + 1)
#             continue
#         end

#         set -l folder_name "$digits"

#         # Create directory if it doesn't exist
#         if not test -d "$folder_name"
#             if not mkdir -p "$folder_name" 2>/dev/null
#                 echo "Error: Failed to create directory '$folder_name' for '$f'"
#                 set errors (math $errors + 1)
#                 continue
#             end
#             echo "Created directory: '$folder_name'"
#         end

#         # Extract zip file into the folder
#         echo "Extracting '$f' → '$folder_name/'"
#         if unzip -q -o "$f" -d "$folder_name" 2>/dev/null
#             echo "Successfully extracted '$f' to '$folder_name/'"
#             set extracted (math $extracted + 1)

#             # Optionally remove the original zip file (uncomment next line if desired)
#             # rm "$f" && echo "Removed original: '$f'"
#         else
#             echo "Error: Failed to extract '$f'"
#             set errors (math $errors + 1)
#         end

#         echo "" # Empty line for readability
#     end

#     # Summary
#     echo "Summary:"
#     echo "  Files processed: $processed"
#     echo "  Successfully extracted: $extracted"
#     echo "  Skipped: $skipped"
#     echo "  Errors: $errors"

#     # Return appropriate exit code
#     if test $errors -gt 0
#         return 1
#     else
#         return 0
#     end
# end
