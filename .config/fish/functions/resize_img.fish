function resize_img --description "resize the png images"
    find . -type f -name '*.png' -exec basename {} .png \; | parallel -j 2 -I{} --max-args 1 convert -resize 40% {}.png {}-new.png
end
