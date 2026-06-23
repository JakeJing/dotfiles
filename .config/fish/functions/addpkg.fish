function addpkg --description "add tex pkg and update"
    sudo tlmgr install $argv
    sudo tlmgr update --self
end
