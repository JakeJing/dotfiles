function ViewVimTerm --description 'open file either in termpdf or vim'
    # set the extension list for pdf docs
    set PDFExt .pdf .djvu .tif
    set IMGExt .png .jpeg .jpg
    set VideoExt .mp4 .avi .wmv .dat .3gp .ogv .mkv .mpg .mpeg .mov
    set DocExt .md .txt .toml .yaml

    # check file extension to see whether it is included in the list
    if contains $(path extension $argv) $PDFExt
        termpdf.py $argv
    else if contains $(path extension $argv) $IMGExt
        timg --title --center --clear $argv
    else if contains $(path extension $argv) $VideoExt
        timg --title="Ctrl-C to Exit!" --center --clear $argv
    else if contains $(path extension $argv) $DocExt
        hx $argv
    else
        nvim $argv
    end
end

# if test $(path extension $argv) = ".pdf"
# # check the extension of a filename
# termpdf.py $argv
# else
# vim $argv
# end
# end

# if contains '*.pdf' $argv
## Previous version with switch ##
# switch $argv
# case '*.pdf'
# termpdf.py $argv
# case '*.png'
# termpdf.py $argv
# case '*.jpeg'
# termpdf.py $argv
# # case '*.md'
# # vim $argv
# # case '*.Rmd'
# # vim $argv
# # case '*.py'
# # vim $argv
# # case '*.js'
# # vim $argv
# # case '*.css'
# # vim $argv
# case '*'
# vim $argv
# end
# end
