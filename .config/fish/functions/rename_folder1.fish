function rename_folder1
    for dir in */
        # Remove trailing slash
        set dirname (echo $dir | sed 's:/$::')

        # Extract first 3 characters
        set prefix (echo $dirname | cut -c1-3)

        # Check if prefix is exactly 3 digits
        if not echo $prefix | grep -qE '^[0-9]{3}$'
            echo "Skipping $dirname (no leading 3 digits)"
            continue
        end

        # Rename if needed
        if test "$dirname" != "$prefix"
            echo "Renaming $dirname -> $prefix"
            mv -- "$dirname" "$prefix"
        else
            echo "No rename needed for $dirname"
        end
    end
end
