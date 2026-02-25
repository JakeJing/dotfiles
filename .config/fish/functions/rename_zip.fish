function rename_zip --description 'Rename each .zip to last 3 digits.zip'
    for f in *.zip
        # Grab only the 3 digits right before ".zip"
        set -l num (string match -r -g '(\d{3})\.zip$' -- "$f")

        if test -n "$num"
            set -l new "$num.zip"

            if test "$f" = "$new"
                echo "Already correct: $f"
            else if test -e "$new"
                echo "Skipping $f → $new (target exists)"
            else
                mv -- "$f" "$new"
                echo "$f → $new"
            end
        else
            echo "Skipping $f (no 3-digit match before .zip)"
        end
    end
end
